import 'package:flutter/material.dart';

abstract class Style {
  static const primaryColor = Color(0xffc2185b);
  static const accentColor = Colors.white;
  static const hintColor = Colors.white;
  static const loginBgColor = [Colors.white, Color(0xff444444)];
  static const Color textColor = Colors.white;

  static const LinearGradient bgGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white, Color(0xff444444)]);

  static const TextStyle textFieldStyle = TextStyle(fontSize: 24.00);

  static const TextStyle buttonTextStyle =
      TextStyle(color: Colors.white, fontSize: 16.00);
}
