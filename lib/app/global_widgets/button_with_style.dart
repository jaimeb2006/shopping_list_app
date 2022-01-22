import 'package:flutter/material.dart';

Widget actionButton({
  required Color colorText,
  required Color colorBackground,
  required String textButton,
  VoidCallback? onClickAction,
}) {
  // if(onClickAction){}
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.grey[300],
        // onPrimary: Colors.grey[300],
        primary: colorBackground,
      ),
      child: Container(
        width: 250,
        height: 45,
        alignment: Alignment.center,
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorText,
            fontSize: 17,
          ),
        ),
      ),
      onPressed: onClickAction);
}
