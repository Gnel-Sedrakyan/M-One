import 'package:m_one/domain/auth/value_objects.dart';
import 'package:m_one/infrastructure/auth/models/user_model.dart';

abstract class IAuthDataSource {
  Future<UserModel> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  });

  Future<UserModel> registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  });
}
