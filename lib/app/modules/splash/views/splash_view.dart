import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/global_widgets/button_with_style.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'SplashView is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            actionButton(
                onClickAction: () => Get.offNamed(Routes.HOME),
                color: Colors.green,
                textButton: 'Go Home'),
          ],
        ),
      ),
    );
  }
}
