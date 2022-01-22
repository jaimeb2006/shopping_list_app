import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/user_model.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();
  

  Future<UserModel> singInUser(
    String name,
    String email,
    String password,
  ) async {
    var params = {
      "username": email,
      "email": email,
      "password": password,
      'name': name
    };

    final response = await _dio.post(
      '/auth/local/register',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: (params),
    );

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    var params = {
      "identifier": email,
      "password": password,
    };
    final response = await _dio.post(
      '/auth/local',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );

    return UserModel.fromJson(response.data);
  }
}
