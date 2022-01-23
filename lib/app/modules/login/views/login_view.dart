import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping_list/app/global_widgets/button_with_style.dart';
import 'package:shopping_list/app/modules/login/local_widgets/button_text_login.dart';
import 'package:shopping_list/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends GetView<LoginController> {
  final logInController = Get.put(LoginController());

  bool isLoginButtonEnabled(LoginController logInController) {
    return logInController.isFormValid.value;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   _emailController.addListener(_onEmailChanged);
  //   _passwordController.addListener(_onPasswordChanged);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Iniciar sesión'),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                  onChanged: logInController.onEmailChanged,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                    // errorText: logInController.isValidEmailInput2.value
                  ),

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  validator: (value) {
                    if (value == '') {
                      return null;
                    } else {
                      return logInController.isErrorValidEmail(value ?? '');
                    }
                  },
                  // validator: (_) {
                  //   return !state.isEmailValid ? 'Email Incorrecto' : null;
                  // },
                ),
                TextFormField(
                  onChanged: logInController.onPasswordChanged,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  validator: (value) {
                    if (value == '') {
                      return null;
                    } else {
                      return logInController.isErrorValidPassword(value ?? '');
                    }
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Obx(() {
                  return actionButton(
                      onClickAction: logInController.isFormValid.value
                          ? logInController.summiting
                          : null,
                      colorBackground: Colors.blue,
                      colorText: Colors.white,
                      textButton: 'Iniciar sesión');
                }),
                const SizedBox(
                  height: 5.0,
                ),
                textButtonLogin(
                    onClickAction: () {
                      Get.toNamed(Routes.FORGET_PASSWORD);
                    },
                    colorBackground: Colors.white,
                    colorText: Colors.blueAccent,
                    textButton: '¿Olvidaste la contraseña?'),
                const SizedBox(
                  height: 10.0,
                ),
                actionButton(
                    onClickAction: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    colorBackground: Colors.blue,
                    colorText: Colors.white,
                    textButton: 'Crear cuenta'),
                const SizedBox(
                  height: 5,
                ),
                logInController.obx((state) => const Text(''),
                    onError: (error) => const Text(
                          "Error al Iniciar sesión",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20, color: Colors.redAccent),
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
