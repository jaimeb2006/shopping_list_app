import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/model/user_model.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';

// class MockAuthenticationAPI implements AuthenticationAPI {
//   @override
//   Future<UserModel> SingInUser() async {
//     // TODO: implement SingInUser
//     // throw UnimplementedError();
//     // return UserModel(id: 1, username: 'username', email: 'email', jwt: 'jwt');
//   }
// }

class DependencyInjection {
  static void init() {
    Get.lazyPut<Dio>(
      () => Dio(BaseOptions(
        baseUrl: 'http://192.168.31.216:1337',
      )),
    );
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
  }
}
