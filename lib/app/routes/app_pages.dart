import 'package:flutter_graduation_thesis/app/ui/android/transaction_screen/transaction_screen.dart';
import 'package:flutter_graduation_thesis/app/ui/android/home_screen/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_graduation_thesis/app/bindings/details_binding.dart';
import 'package:flutter_graduation_thesis/app/bindings/home_binding.dart';
import 'package:flutter_graduation_thesis/app/ui/android/details/details_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
  ];
}
