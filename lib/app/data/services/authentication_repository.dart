import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/data/providers/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<UserModel> newSingInUser(String name, String email, String password) =>
      _api.singInUser(
        name,
        email,
        password,
      );
  Future<UserModel> loginWithEmailAndPassword(String email, String password) =>
      _api.loginWithEmailPassword(
        email,
        password,
      );
}
