import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/modules/home/local_widgets/item_list.dart';

import '../controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  final homeController = HomeController.to;
  final _scrollController = ScrollController();

  // final apiController = Get.put(ApiRequestController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                showAlertCerrarSeccion(context);
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return SingleChildScrollView(
              child: SizedBox(
                  height: size.height - 100,
                  child: ListView.builder(
                    itemCount: homeController.listNotes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                            if (details.primaryVelocity! < 0) {
                              homeController.deletDataBaseItem(
                                  homeController.listNotes[index]);
                            }
                          },
                          onTap: () {
                            homeController
                                .editItem(homeController.listNotes[index]);
                          },
                          child: itemListUi(
                              note: homeController.listNotes[index]));
                    },
                    controller: _scrollController,
                  )),
            );
          })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.newItem();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  showAlertCerrarSeccion(BuildContext context) {
    // set up the buttons
    Widget cancelButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.grey[300],
          primary: Colors.red,
        ),
        child: Container(
          width: 250,
          height: 45,
          alignment: Alignment.center,
          child: const Text(
            'Cancelar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }

    Widget cerrarSesionButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.grey[300],
          primary: Colors.green,
        ),
        child: Container(
          width: 250,
          height: 45,
          alignment: Alignment.center,
          child: const Text(
            'Cerrar Sesión ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        onPressed: () {
          homeController.logOut();
          // Navigator.of(context).pop();
        },
      );
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Cerrar Sesión ",
        textAlign: TextAlign.center,
      ),
      content: const Text("Está seguro de cerrar sesión ",
          textAlign: TextAlign.center),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cerrarSesionButton(),
            const SizedBox(height: 10),
            cancelButton(),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
