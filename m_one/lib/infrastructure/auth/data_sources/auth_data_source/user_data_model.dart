import 'dart:convert';

/* 
  This model is for test only, 
  This is used to store email pass and username to local storage, 
  In real app it will be done by server
*/
class UserDataModel {
  final String refreshToken;
  final String accessToken;
  final String email;
  final String username;
  final String password;

  UserDataModel({
    required this.refreshToken,
    required this.accessToken,
    required this.email,
    required this.username,
    required this.password,
  });

  UserDataModel copyWith({
    String? refreshToken,
    String? accessToken,
    String? email,
    String? username,
    String? password,
  }) {
    return UserDataModel(
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'refreshToken': refreshToken,
      'accessToken': accessToken,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      refreshToken: (map['refreshToken']),
      accessToken: (map['accessToken']),
      email: (map['email']),
      username: (map['username']),
      password: (map['password']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) {
    return UserDataModel.fromMap(json.decode(source));
  }
}
