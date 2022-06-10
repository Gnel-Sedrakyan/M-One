import 'package:m_one/domain/auth/register_failure.dart';
import 'package:m_one/domain/auth/sign_in_failure.dart';
import 'package:m_one/domain/auth/user.dart';
import 'package:m_one/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthDataRepository {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<Either<SignInFailure, Unit>> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  });

  Future<Either<RegisterFailure, Unit>>
      registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  });

  Future<Option<User>> getSignedInUser();

  Future<void> signOut();
}
