import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authRepository =
      Get.find<AuthenticationRepository>();
  final isFormValid = false.obs;
  String _email = '', _password = '';
  final _storage = const FlutterSecureStorage();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;

    isFormValid.value = true;
  }

  @override
  void onClose() {}
  Future<void> summiting() async {
    try {
      final user =
          await _authRepository.loginWithEmailAndPassword(_email, _password);
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

      await _readAll(user);
      Get.offNamed(Routes.HOME, arguments: user);
    } catch (e) {
      printError(
        info: e.toString(),
      );
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  Future<void> _readAll(UserModel user) async {
    final all = await _storage.readAll(aOptions: _getAndroidOptions());
    printError(info: all.toString());

    return;
  }
}
