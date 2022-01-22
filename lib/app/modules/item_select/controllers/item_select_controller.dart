import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/models/user_model.dart';
import 'package:shopping_list/app/data/services/notes_repository.dart';
import 'package:shopping_list/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

class ItemSelectController extends GetxController {
  //TODO: Implement ItemSelectController
  final note = NotesModel().obs;
  String _titulo = '', _descripcion = '';
  bool _isNew = false;
  final NotesRepository _notesRepository = Get.find<NotesRepository>();
  final homeController = HomeController.to;
  late UserModel _authUser;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    _authUser = arguments[0]['userAuth'];
    note.value = arguments[1]['note'] ?? NotesModel();
    _isNew = arguments[2]['new'] ?? false;
    _titulo = note.value.title ?? '';
    _descripcion = note.value.description ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onTituloChanged(String text) {
    _titulo = text;
  }

  void onDescriptionChanged(String text) {
    _descripcion = text;
  }

  void deletItem() {}
  Future<void> deleteItem() async {
    if (_isNew) {
      Get.offNamed(Routes.HOME, arguments: [
        {"userAuth": _authUser},
      ]);
    } else {
      final int idT = note.value.id ?? 0;
      try {
        await _notesRepository.deleteNote(_authUser.jwt, idT);
        homeController.deletItem(idT);
        Get.offNamed(Routes.HOME, arguments: [
          {"userAuth": _authUser},
        ]);
      } catch (e) {}
    }
  }

  Future<void> saveItem() async {
    final NotesModel noteT = note.value;
    noteT.title = _titulo;
    noteT.description = _descripcion;
    noteT.state = true;

    try {
      if (_isNew) {
        final note = await _notesRepository.postNotes(_authUser.jwt, noteT);
        homeController.addNew(note);
      } else {
        await _notesRepository.updateNotes(_authUser.jwt, noteT);
      }
      Get.offNamed(Routes.HOME, arguments: [
        {"userAuth": _authUser},
      ]);
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
