import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class RegisterController extends GetxController with StateMixin {
  final AuthenticationRepository _authRepository =
      Get.find<AuthenticationRepository>();
  final _storage = const FlutterSecureStorage();

  RegisterController() {
    change("", status: RxStatus.empty());
  }

  void createUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      change(null, status: RxStatus.loading());
      final user = await _authRepository.newSingInUser(name, email, password);
      await _storage.write(
          key: 'username',
          value: user.username,
          aOptions: _getAndroidOptions());
      await _storage.write(
          key: 'id', value: user.id.toString(), aOptions: _getAndroidOptions());
      await _storage.write(
          key: 'jwt', value: user.jwt, aOptions: _getAndroidOptions());
      await _storage.write(
          key: 'email', value: user.email, aOptions: _getAndroidOptions());

      change(user.jwt, status: RxStatus.success());
      Get.toNamed(Routes.HOME, arguments: [
        {"userAuth": user},
      ]);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
