import 'package:flutter/material.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.jwt,
  });

  int id;
  String username;
  String email;
  String jwt;

  factory UserModel.fromJson(Map<String, dynamic> request) {
    String jwt = request['jwt'];
    Map<String, dynamic> user = request['user'];
    return UserModel(
      id: user["id"],
      username: user["username"],
      email: user["email"],
      jwt: jwt,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "jwt": jwt,
      };
}
