import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/data/services/notes_repository.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin {
  static HomeController get to => Get.find<HomeController>();
  final userAuth = UserModel.empty().obs;
  final _storage = const FlutterSecureStorage();
  final RxList<NotesModel> listNotes = RxList<NotesModel>();
  final NotesRepository _notesRepository = Get.find<NotesRepository>();

  HomeController() {
    change("", status: RxStatus.empty());
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    print(userAuth.toJson().toString());
    userAuth.value = Get.arguments;
    change("", status: RxStatus.loading());
    final list = await _notesRepository.getAllNotes(userAuth.value.jwt);
    list.forEach((item) {
      listNotes.add(item);
    });
    change("", status: RxStatus.success());
  }

  void logOut() async {
    await _storage.deleteAll(aOptions: _getAndroidOptions());
    Get.offNamed(Routes.LOGIN);
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  test() {
    print('Test home');
  }

  test2() {
    Get.toNamed(Routes.FORGET_PASSWORD);
  }
}
