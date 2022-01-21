import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/model/user_model.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

// class SplashController extends GetxController {
//   //TODO: Implement SplashController
//   final AuthenticationRepository _repository =
//       Get.find<AuthenticationRepository>();

//   @override
//   Future<void> onInit() async {
//     // _init();
//     super.onInit();
//     print('object');
//     // _init();
//     // Get.offNamed(Routes.HOME);
//   }

//   _init() async {
//     print('init');
//     try {
//       UserModel user = await _repository.newSingInUser();
//       print(user.email);
//     } on DioError catch (e) {
//       printError(info: 'holas');
//       print(e.message);
//     }
//   }

//   @override
//   void onReady() {
//     super.onReady();
//     print('Ready');
//     // _init();
//   }

//   @override
//   void onClose() {}
// }

class SplashController extends GetxController {
  final AuthenticationRepository _repository =
      Get.find<AuthenticationRepository>();

  @override
  Future<void> onInit() async {
    // _init();
    super.onInit();
    print('object');
    // _init();
  }

  @override
  void onReady() {
    _init();
  }

  _init() async {
    print('initre');

    try {
      // UserModel user = await _repository.newSingInUser();
      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
    }
  }
}
