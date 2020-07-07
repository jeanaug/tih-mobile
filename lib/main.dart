import 'package:flutter/material.dart';
import 'package:tih_mobile/screens/login.dart';
import 'package:tih_mobile/style.dart';

void main() {
  runApp(TihApp());
}

class TihApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Style.primaryColor,
        accentColor: Style.accentColor,
        hintColor: Style.hintColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Style.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      title: 'Tih Admin',
      home: Login(),
    );
  }
}
