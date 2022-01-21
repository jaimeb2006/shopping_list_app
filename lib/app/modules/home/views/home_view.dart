import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/data/provider/authentication_api.dart';
import 'package:shopping_list/app/global_widgets/button_with_style.dart';
import 'package:shopping_list/app/modules/home/controllers/api_request_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = HomeController.to;
  // final apiController = Get.put(ApiRequestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  "Counter: ${homeController.count.value}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              actionButton(
                  onClickAction: () => homeController.increment(),
                  color: Colors.green,
                  textButton: 'Add'),
              const SizedBox(
                height: 30,
              ),
              actionButton(
                  onClickAction: () => homeController.decrement(),
                  color: Colors.red,
                  textButton: 'Subtract'),
              const SizedBox(
                height: 50,
              ),
              // apiController.obx(
              //   (data) => Text(
              //     "Datos: $data",
              //     style: const TextStyle(fontSize: 20),
              //   ),
              //   onError: (error) => Text(
              //     "Error: $error",
              //     style: const TextStyle(fontSize: 20, color: Colors.redAccent),
              //   ),
              //   onLoading: const CircularProgressIndicator(),
              //   onEmpty: const Text("Sin Inicializar",
              //       style: TextStyle(fontSize: 20)),
              // ),

              const SizedBox(
                height: 20,
              ),
              actionButton(
                  onClickAction: () => {},
                  color: Colors.amber,
                  textButton: 'Api Request'),
            ],
          ),
        ));
  }
}
