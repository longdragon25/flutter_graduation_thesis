import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_text_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: textTheme(),
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark)),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
