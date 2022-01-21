import 'package:get/get.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';

import 'package:shopping_list/app/modules/home/controllers/api_request_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRequestController>(
      // ignore: unnecessary_new
      () => ApiRequestController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
