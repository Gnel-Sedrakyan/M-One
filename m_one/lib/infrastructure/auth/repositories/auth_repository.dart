import 'dart:developer';

import 'package:m_one/domain/auth/register_failure.dart';
import 'package:m_one/domain/auth/sign_in_failure.dart';
import 'package:m_one/domain/auth/user.dart';
import 'package:m_one/domain/auth/value_objects.dart';
import 'package:m_one/domain/core/errors.dart';
import 'package:m_one/infrastructure/auth/data_sources/auth_data_source/i_auth_data_source.dart';
import 'package:m_one/infrastructure/auth/data_sources/user_data_source/i_user_data_source.dart';

import 'package:m_one/infrastructure/auth/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'i_auth_repository.dart';

@LazySingleton(as: IAuthDataRepository)
class AuthDataRepository implements IAuthDataRepository {
  final IUserDataSource userDataSource;
  final IAuthDataSource authDataSource;

  AuthDataRepository({
    required this.userDataSource,
    required this.authDataSource,
  });

  @override
  Future<Either<SignInFailure, Unit>> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  }) async {
    try {
      final UserModel user = await authDataSource.signInWithUsernameAndPassword(
        username: username,
        password: password,
      );
      await userDataSource.cacheUser(user);

      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'INVALID_CREDENTIALS_COMBINATION') {
        return left(const SignInFailure.invalidCredentialsCombination());
      } else {
        return left(const SignInFailure.serverError());
      }
    }
  }

  @override
  Future<Either<RegisterFailure, Unit>>
      registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  }) async {
    try {
      final UserModel user =
          await authDataSource.registerWithEmailAndUsernameAndPassword(
        username: username,
        password: password,
        email: email,
      );
      await userDataSource.cacheUser(user);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'EMAIL_ALREDY_IN_USE') {
        return left(const RegisterFailure.emailAlredyRegistered());
      } else {
        return left(const RegisterFailure.serverError());
      }
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    try {
      final UserModel user = await userDataSource.getCachedUser();
      return Some(user);
    } on NoCachedValueError catch (a_) {
      return none();
    }
  }

  @override
  Future<void> signOut() async {
    await userDataSource.removeCachedUser();
  }
}
