import 'package:flutter/material.dart';

class ColorsTheme {
  static final ColorsTheme _instance = ColorsTheme._internal();

  factory ColorsTheme() {
    return _instance;
  }
  ColorsTheme._internal();
  static Color colorTextDefault_10 = const Color(0xff2c3a45);
  static Color colorTextDefault_20 = const Color(0xff374856);
  static Color colorTextGrey = Colors.grey;
  static Color colorOfBox = Colors.white;

  static Color mainGreen = const Color.fromRGBO(112, 191, 65, 1);
  static Color mainRed = Colors.red;

  static Color mainBackgroundColor = const Color(0xF5F5F5F5);
  static Color foregroundColor = Colors.white;
// Màu bar chart.
  static Color incomeBarColor = const Color(0xff53fdd7);
  static Color expenseBarColor = const Color(0xffff5182);
}
