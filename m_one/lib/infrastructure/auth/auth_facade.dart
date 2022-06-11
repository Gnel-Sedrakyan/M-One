import 'dart:async';
import 'dart:developer';

import 'package:m_one/domain/auth/register_failure.dart';
import 'package:m_one/domain/auth/user.dart';
import 'package:m_one/infrastructure/auth/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:m_one/domain/auth/sign_in_failure.dart';
import 'package:m_one/domain/auth/i_auth_facade.dart';
import 'package:m_one/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final IAuthDataRepository _authDataRepository;

  AuthFacade(
    this._authDataRepository,
  );

  @override
  Future<Either<SignInFailure, Unit>> signInWithUsernameAndPassword(
      {required Username username, required Password password}) async {
    return _authDataRepository.signInWithUsernameAndPassword(
        username: username, password: password);
  }

  @override
  Future<Either<RegisterFailure, Unit>>
      registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  }) async {
    log('started registering');
    return _authDataRepository.registerWithEmailAndUsernameAndPassword(
        username: username, password: password, email: email);
  }

  @override
  Future<Option<User>> getSignedInUser() {
    return _authDataRepository.getSignedInUser();
  }

  @override
  Future<void> signOut() async {
    await _authDataRepository.signOut();
  }
}
