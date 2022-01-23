import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/global_widgets/button_with_style.dart';
import '../controllers/register_controller.dart';

// ignore: use_key_in_widget_constructors
class RegisterView extends GetView<RegisterController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final registerController = Get.put(RegisterController());
  // final logInController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear cuenta'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Nombre",
                  ),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  // validator: (_) {
                  //   return !state.isPasswordvalid
                  //       ? 'Contraseña Incorrecta'
                  //       : null;
                  // },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  // validator: (_) {
                  //   return !state.isEmailValid ? 'Email Incorrecto' : null;
                  // },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  // validator: (_) {
                  //   return !state.isPasswordvalid
                  //       ? 'Contraseña Incorrecta'
                  //       : null;
                  // },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                actionButton(
                    onClickAction: () => registerController.createUser(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text),
                    colorBackground: Colors.blue,
                    colorText: Colors.white,
                    textButton: 'Crear cuenta'),
                const SizedBox(
                  height: 20.0,
                ),
                registerController.obx((data) {
                  return Container();
                },
                    onError: (error) => Text(
                          "Error: $error",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.redAccent),
                        ),
                    onLoading: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    onEmpty: Container()),
              ],
            ),
          ),
        ));
  }
}
