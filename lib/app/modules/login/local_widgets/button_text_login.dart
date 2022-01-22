import 'package:flutter/material.dart';

Widget textButtonLogin({
  required Color colorText,
  required Color colorBackground,
  required String textButton,
  VoidCallback? onClickAction,
}) {
  // if(onClickAction){}
  return TextButton(
      child: Text(
        textButton,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorText,
          fontSize: 17,
        ),
      ),
      onPressed: onClickAction);
}
