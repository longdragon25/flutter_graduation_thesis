import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/routes/app_pages.dart';
import 'package:flutter_graduation_thesis/app/translations/app_translations.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
