import 'package:flutter/material.dart';

class MyButtonTheme {
  String? nameButton;
  Function() onFunction;
  final Widget? icon;

  MyButtonTheme({this.icon, this.nameButton, required this.onFunction});

  Widget outlineButton() {
    return OutlinedButton(
      onPressed: onFunction(),
      child: Text(nameButton ?? ''),
    );
  }
}
