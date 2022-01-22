import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/providers/notes_api.dart';

class NotesRepository {
  final NotesAPI _api = Get.find<NotesAPI>();

  Future<List<NotesModel>> getAllNotes(String jwt) => _api.getAllNotes(jwt);

  Future<NotesModel> getOneNotes(String jwt, int id) => _api.getNotes(jwt, id);

  Future<NotesModel> postNotes(String jwt, NotesModel notes) =>
      _api.postNotes(jwt, notes);

  Future<int> deleteNote(String jwt, int id) => _api.deleteNotes(jwt, id);

  Future<NotesModel> updateNotes(String jwt, NotesModel notes) =>
      _api.updateNotes(jwt, notes);
}
