import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin {
  static HomeController get to => Get.find<HomeController>();
  final userAuth = UserModel.empty().obs;
  final _storage = const FlutterSecureStorage();
  final List<NotesModel> listNotes = [];

  HomeController() {
    change("", status: RxStatus.empty());
  }

  @override
  void onInit() {
    super.onInit();
    userAuth.value = Get.arguments;
  }

  Future<void> logOut() async {
    await _storage.deleteAll(aOptions: _getAndroidOptions());
    Get.offNamed(Routes.LOGIN);
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
