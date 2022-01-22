import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/providers/notes_api.dart';
import 'package:shopping_list/app/data/providers/authentication_api.dart';
import 'package:shopping_list/app/data/services/authentication_repository.dart';
import 'package:shopping_list/app/data/services/notes_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<Dio>(
      () => Dio(BaseOptions(
        baseUrl: 'http://192.168.31.216:1337',
      )),
    );
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<NotesAPI>(() => NotesAPI());
    Get.lazyPut<NotesRepository>(() => NotesRepository());
  }
}
