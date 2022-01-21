import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print('holas');
    Get.lazyPut(() => SplashController());
  }
}
