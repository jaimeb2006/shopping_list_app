// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
