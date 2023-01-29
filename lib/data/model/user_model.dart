import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  const UserModel({
    this.email,
    this.userName,
    required this.uid,
    this.token,
    required this.accessToken,
  });

  final String? userName;
  final String? email;
  final String uid;
  final int? token;
  final String accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        uid: json["uid"],
        email: json["email"],
        token: json["token"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "uid": uid,
        "email": email,
        "token": token,
        "accessToken": accessToken,
      };

  @override
  List<Object?> get props => [uid, userName, email, token, accessToken];
}
