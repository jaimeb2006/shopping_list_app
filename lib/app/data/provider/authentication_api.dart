import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/model/user_model.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<UserModel> SingInUser() async {
    var params = {
      "username": "test8@test.com",
      "email": "test8@test.com",
      "password": "123456",
      'name': 'Jaime'
    };

    final response = await _dio.post(
      '/auth/local/register',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );

    return UserModel.fromJson(response.data);
  }
}
