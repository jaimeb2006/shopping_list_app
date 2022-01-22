import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final user = UserModel.empty().obs;
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onInit() async {
    // _init();
    super.onInit();

    // _init();
  }

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      final all = await _storage.readAll(aOptions: _getAndroidOptions());
      if (all['jwt'].toString().isEmpty) {
        // Get.offNamed(Routes.LOGIN);
      } else {
        printError(info: 'inicio falso');
        final id = int.parse(all['id'].toString());
        final user = UserModel(
            id: id,
            username: all['username'].toString(),
            email: all['email'].toString(),
            jwt: all['jwt'].toString());

        Get.toNamed(Routes.HOME, arguments: [
          {"userAuth": user},
        ]);
      }
    } catch (e) {
      Get.offNamed(Routes.LOGIN);
    }
  }

  void setUser(UserModel userT) {
    user.value.username = userT.username;
    user.value.jwt = userT.jwt;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
