import 'package:m_one/domain/auth/user.dart';
import 'package:m_one/domain/core/value_objects.dart';
import 'dart:convert';

class UserModel extends User {
  final RefreshToken refreshToken;
  final AccessToken accessToken;

  UserModel({
    required UniqueId id,
    required this.refreshToken,
    required this.accessToken,
  }) : super(id: id);

  @override
  UserModel copyWith({
    UniqueId? id,
    RefreshToken? refreshToken,
    AccessToken? accessToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'refreshToken': refreshToken.getOrCrash(),
      'accessToken': accessToken.getOrCrash(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: UniqueId(),
      refreshToken: RefreshToken(map['refreshToken']),
      accessToken: AccessToken(map['accessToken']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(json.decode(source));
  }
}
