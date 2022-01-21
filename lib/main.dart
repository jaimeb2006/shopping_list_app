import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_list/app/modules/login/controllers/login_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(LoginController());
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
