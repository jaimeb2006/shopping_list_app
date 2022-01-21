import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  // final Dio _dio;

  // AuthProvider(this._dio);
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<String> llamadaApi() async {
    await Future.delayed(const Duration(seconds: 3));
    return "Datos recibidos";
  }
}
