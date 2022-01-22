import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/models/user_model.dart';

class NotesAPI {
  final Dio _dio = Get.find<Dio>();

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

// NotesModel notes
  Future<NotesModel> postNotes(String jwt, NotesModel note) async {
    _dio.options.headers['authorization'] = "Bearer " + jwt;

    final response = await _dio.post('/notes',
        data: note.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType));
    // print(res);

    return NotesModel.fromJson(response.data);
  }

  // Future<Response> deleteNotes(int id) async => await delete('notes/$id');
}
