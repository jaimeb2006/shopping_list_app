import 'package:get/get.dart';
import 'package:shopping_list/app/data/model/user_model.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<UserModel> newSingInUser() => _api.SingInUser();
}
