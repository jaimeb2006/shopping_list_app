import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/data/services/notes_repository.dart';

import '../controllers/item_select_controller.dart';

class ItemSelectView extends GetView<ItemSelectController> {
  final itemSelectController = Get.put(ItemSelectController());
  final NotesRepository _notesRepository = Get.find<NotesRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar '),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    itemSelectController.deleteItem();
                  });
                }),
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    itemSelectController.saveItem();
                    // itemSelectController.saveItem();
                  });
                }),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Obx(() {
                return TextFormField(
                  onChanged: itemSelectController.onTituloChanged,
                  initialValue: itemSelectController.note.value.title,
                  decoration: const InputDecoration(
                    hintText: "Título",
                  ),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  style: const TextStyle(
                    // color: Colors.black45,
                    fontSize: 20,
                  ),
                );
              }),
              Obx(() {
                return SingleChildScrollView(
                  child: TextFormField(
                    minLines: 17,
                    maxLines: 30,
                    keyboardType: TextInputType.multiline,
                    onChanged: itemSelectController.onDescriptionChanged,
                    initialValue: itemSelectController.note.value.description,
                    decoration: const InputDecoration(
                      hintText: "Nota",
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    style: const TextStyle(
                      // color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
