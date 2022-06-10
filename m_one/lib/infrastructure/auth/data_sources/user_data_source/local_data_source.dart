import 'package:m_one/domain/core/errors.dart';
import 'package:m_one/domain/core/value_objects.dart';
import 'package:m_one/infrastructure/auth/data_sources/user_data_source/i_user_data_source.dart';
import 'package:m_one/infrastructure/auth/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedUser = 'CACHED_USER';

@LazySingleton(as: IUserDataSource)
class AuthLocalDataSource implements IUserDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource({required this.sharedPreferences});

  @override
  Future<UserModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(cachedUser);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonString));
    } else {
      throw NoCachedValueError();
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
      cachedUser,
      userToCache.toJson(),
    );
  }

  @override
  Future<void> removeCachedUser() async {
    final jsonString = await sharedPreferences.remove(cachedUser);
    if (jsonString == true) {
    } else {
      throw NoCachedValueError();
    }
  }

  @override
  Future<bool> updateAccessToken(AccessToken tokenToCache) async {
    final UserModel user = await getCachedUser();
    final newUser = user.copyWith(accessToken: tokenToCache);
    return await sharedPreferences.setString(
      cachedUser,
      newUser.toJson(),
    );
  }
}
