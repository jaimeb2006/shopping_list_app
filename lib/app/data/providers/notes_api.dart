import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';
import 'package:shopping_list/app/data/models/user_model.dart';

class NotesAPI {
  final Dio _dio = Get.find<Dio>();

  Future<NotesModel> getNotes(int id) async {
    final response = await _dio.get(
      '/notes/$id',
    );
   
    return NotesModel.fromJson(response.data);
  }

  Future<List<NotesModel>> getAllNotes(int id) async {
    _dio.options.headers['authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImlhdCI6MTY0MjgyMjAwNiwiZXhwIjoxNjQ1NDE0MDA2fQ.nAfZCDn-r-YUpjCxTXnG4gOubo7STIkn1kznE6k-Kec';

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
  Future<NotesModel> postNotes() async {
    _dio.options.headers['authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImlhdCI6MTY0MjgyMjAwNiwiZXhwIjoxNjQ1NDE0MDA2fQ.nAfZCDn-r-YUpjCxTXnG4gOubo7STIkn1kznE6k-Kec';

    final response = await _dio.post('/notes',
        data: {'id': 5, 'title': 'title'},
        options: Options(contentType: Headers.formUrlEncodedContentType));
    // print(res);
   
    return NotesModel.fromJson(response.data);
  }

  // Future<Response> deleteNotes(int id) async => await delete('notes/$id');
}
