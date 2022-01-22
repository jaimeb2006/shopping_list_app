import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class LoginController extends GetxController with StateMixin {
  final AuthenticationRepository _authRepository =
      Get.find<AuthenticationRepository>();
  final isFormValid = false.obs;
  bool isNotSummit = true;
  bool isValidPasswordInput = false;

  final isValidEmailInput2 = 'errrro'.obs;
  String _email = '', _password = '';
  final _storage = const FlutterSecureStorage();

  LoginController() {
    change("", status: RxStatus.empty());
  }

  void onEmailChanged(String text) {
    _email = text;
    isFormValid.value = isValidEmail(_email) && (_password.length >= 6);
    change("", status: RxStatus.empty());
  }

  void onPasswordChanged(String text) {
    _password = text;

    isFormValid.value = isValidEmail(_email) && (_password.length >= 6);
    change("", status: RxStatus.empty());
  }

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  String? isErrorValidEmail(String text) {
    if (!isValidEmail(text)) {
      return 'Email Incorrecto';
    } else {
      return null;
    }
  }

  String? isErrorValidPassword(String text) {
    if ((!(text.length >= 6))) {
      return 'Contraseña Incorrecta';
    } else {
      return null;
    }
  }

  Future<void> summiting() async {
    change("", status: RxStatus.loading());
    if (isValidEmail(_email)) {
      try {
        final user =
            await _authRepository.loginWithEmailAndPassword(_email, _password);
        await _storage.write(
            key: 'username',
            value: user.username,
            aOptions: _getAndroidOptions());
        await _storage.write(
            key: 'id',
            value: user.id.toString(),
            aOptions: _getAndroidOptions());
        await _storage.write(
            key: 'jwt', value: user.jwt, aOptions: _getAndroidOptions());
        await _storage.write(
            key: 'email', value: user.email, aOptions: _getAndroidOptions());

        isFormValid.value = false;

        Get.toNamed(Routes.HOME, arguments: [
          {"userAuth": user},
        ]);
        change("", status: RxStatus.success());
      } catch (e) {
        printError(info: e.toString());
        change("", status: RxStatus.error(e.toString()));
      }
    } else {}
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
