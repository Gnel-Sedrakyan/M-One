import 'dart:developer';

import 'package:m_one/domain/auth/value_objects.dart';
import 'package:m_one/domain/core/value_objects.dart';
import 'package:m_one/infrastructure/auth/data_sources/auth_data_source/i_auth_data_source.dart';
import 'package:m_one/infrastructure/auth/data_sources/auth_data_source/user_data_model.dart';
import 'package:m_one/infrastructure/auth/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const allUsers = 'ALL_USERS';

@LazySingleton(as: IAuthDataSource, env: [
  Environment.dev,
  Environment.test
]) // TODO create the real auth datasource and then delete Environment.dev
class AuthTestDataSource implements IAuthDataSource {
  final SharedPreferences sharedPreferences;

  AuthTestDataSource({required this.sharedPreferences});

  @override
  Future<UserModel> registerWithEmailAndUsernameAndPassword({
    required Username username,
    required Password password,
    required Email email,
  }) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();
    final emailStr = email.getOrCrash();

    final usersJsonList = sharedPreferences.getStringList(allUsers);

    List<UserDataModel> usersList = [];

    if (usersJsonList != null) {
      usersList = usersJsonList.map((e) => UserDataModel.fromJson(e)).toList();
      final sameEmailUserIndex =
          usersList.indexWhere((element) => element.email == emailStr);
      if (sameEmailUserIndex != -1) {
        // if user with this email exsists
        throw PlatformException(code: 'EMAIL_ALREDY_IN_USE');
      }
    }
    // just using email as access token (i think th real authorization will done with jwt)
    final newUser = UserModel(
        id: UniqueId(),
        accessToken: AccessToken(emailStr),
        refreshToken: RefreshToken(emailStr));

    final newUserData = UserDataModel(
      accessToken: emailStr,
      refreshToken: emailStr,
      email: emailStr,
      username: usernameStr,
      password: passwordStr,
    );
    usersList.add(newUserData);

    // TODO use SQLite
    List<String> updatedUsersJsonList =
        usersList.map((e) => e.toJson()).toList();

    await sharedPreferences.setStringList(
      allUsers,
      updatedUsersJsonList,
    );

    return Future.value(newUser);
  }

  @override
  Future<UserModel> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  }) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();

    final usersJsonList = sharedPreferences.getStringList(allUsers);

    if (usersJsonList == null) {
      throw PlatformException(code: 'INVALID_CREDENTIALS_COMBINATION');
    }
    // TODO refactor this (use SQLite here too)
    List<UserDataModel> usersList =
        usersJsonList.map((e) => UserDataModel.fromJson(e)).toList();
    final sameUsernameUserIndex =
        usersList.indexWhere((element) => element.username == usernameStr);

    if (sameUsernameUserIndex == -1) {
      throw PlatformException(code: 'INVALID_CREDENTIALS_COMBINATION');
    }
    final userWithinsertedUsername = usersList[sameUsernameUserIndex];

    if (!(passwordStr == userWithinsertedUsername.password &&
        usernameStr == userWithinsertedUsername.username)) {
      throw PlatformException(code: 'INVALID_CREDENTIALS_COMBINATION');
    }
    return Future.value(UserModel(
        id: UniqueId(),
        accessToken: AccessToken(userWithinsertedUsername.accessToken),
        refreshToken: RefreshToken(userWithinsertedUsername.refreshToken)));
  }
}
