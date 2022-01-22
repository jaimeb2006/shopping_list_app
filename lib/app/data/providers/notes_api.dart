import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';

class NotesAPI {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.31.216:1337',
  ));

  Future<NotesModel> getNotes(String jwt, int id) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;
    final response = await _dio.get(
      '/notes/$id',
    );

    return NotesModel.fromJson(response.data);
  }

  Future<List<NotesModel>> getAllNotes(String jwt) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;

    final response = await _dio.get(
      '/notes/',
    );

    List<NotesModel> list = [];

    response.data.forEach((data) {
      list.add(NotesModel.fromJson(data));
    });

    return list;
  }

// ==============================================================
// Crear Note
// ==============================================================
  Future<NotesModel> postNotes(String jwt, NotesModel note) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;
    final response = await _dio.post('/notes',
        data: note.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType));
    // print(res);

    return NotesModel.fromJson(response.data);
  }

// ==============================================================
// Borrar Note
// ==============================================================
  Future<int> deleteNotes(String jwt, int id) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;

    await _dio.delete(
      '/notes/$id',
    );

    return id;
  }

// ==============================================================
// Actualizar Note
// ==============================================================
  Future<NotesModel> updateNotes(String jwt, NotesModel note) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;

    final response = await _dio.put('/notes/${note.id}',
        data: note.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType));

    return NotesModel.fromJson(response.data);
  }
}
