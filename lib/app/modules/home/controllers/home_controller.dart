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
    final arguments = Get.arguments;
    // print(arguments[0]['userAuth']);
    userAuth.value = arguments[0]['userAuth'];

    change("", status: RxStatus.loading());
    final list = await _notesRepository.getAllNotes(userAuth.value.jwt);
    for (var item in list) {
      listNotes.add(item);
    }
    change("", status: RxStatus.success());
  }

  void logOut() async {
    await _storage.deleteAll(aOptions: _getAndroidOptions());

    Get.toNamed(Routes.LOGIN);
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  editItem(NotesModel note) {
    Get.toNamed(Routes.ITEM_SELECT, arguments: [
      {"userAuth": userAuth.value},
      {"note": note},
      {"new": false}
    ]);
  }

  void deletItem(int id) {
    listNotes.removeWhere((item) => item.id == id);
  }

  Future<void> deletDataBaseItem(NotesModel note) async {
    final int idT = note.id ?? 0;
    try {
      await _notesRepository.deleteNote(userAuth.value.jwt, idT);
      deletItem(idT);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void newItem() {
    Get.toNamed(Routes.ITEM_SELECT, arguments: [
      {"userAuth": userAuth.value},
      {"note": NotesModel()},
      {"new": true}
    ]);
  }

  Future<void> addNew(NotesModel note) async {
    listNotes.add(note);
  }

  @override
  void onClose() {}
}
