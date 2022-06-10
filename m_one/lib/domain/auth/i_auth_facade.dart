import 'package:m_one/domain/auth/register_failure.dart';
import 'package:m_one/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'package:m_one/domain/auth/auth_failure.dart';
import 'package:m_one/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  });
  Future<Either<RegisterFailure, Unit>>
      registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  });
  Future<void> signOut();
}
