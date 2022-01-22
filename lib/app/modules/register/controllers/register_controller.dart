import 'package:get/get.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class RegisterController extends GetxController with StateMixin {
  
  final AuthenticationRepository _authRepository =
      Get.find<AuthenticationRepository>();

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
      change(user.jwt, status: RxStatus.success());
      Get.offNamed(Routes.HOME, arguments: user);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
