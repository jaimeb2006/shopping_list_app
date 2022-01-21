import 'package:flutter/material.dart';

Widget actionButton(
    {required Function onClickAction,
    required Color color,
    required String textButton}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.grey[300],
        primary: color,
      ),
      child: Container(
        width: 250,
        height: 45,
        alignment: Alignment.center,
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      onPressed: () => onClickAction());
}
