import 'package:m_one/domain/core/value_objects.dart';
import 'package:m_one/infrastructure/auth/models/user_model.dart';

abstract class IUserDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserModel> getCachedUser();

  Future<void> removeCachedUser();

  Future<void> cacheUser(UserModel userToCache);
  Future<void> updateAccessToken(AccessToken tokenToCache);
}
