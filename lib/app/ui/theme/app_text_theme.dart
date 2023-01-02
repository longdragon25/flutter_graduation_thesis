import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_colors.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 44,
        color: ColorsTheme.colorTextDefault_10),
    headline2: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorsTheme.colorTextDefault_10),
    headline3: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorsTheme.colorTextDefault_10),
    headline4: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorsTheme.colorTextDefault_10),
    headline5: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: ColorsTheme.colorTextDefault_10),
    headline6: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        color: ColorsTheme.colorTextDefault_10),
    bodyText1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: ColorsTheme.colorTextDefault_10),
    bodyText2: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: ColorsTheme.colorTextDefault_10),
  );
}

TextStyle textTitleStyle() => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.colorTextDefault_10);
