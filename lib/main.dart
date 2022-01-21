import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shopping_list/app/utils/dependency_injection.dart';
import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();

  // Get.put(LoginController());
  // Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
      initialBinding: BindingsBuilder(
        () {
          Get.put(SplashController());
          // Get.put(());
          // Get.put(AuthService());
        },
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
