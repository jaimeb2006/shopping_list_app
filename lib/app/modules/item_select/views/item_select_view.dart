import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/item_select_controller.dart';

class ItemSelectView extends GetView<ItemSelectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ItemSelectView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ItemSelectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
