import 'package:get/get.dart';
import 'package:flutter_graduation_thesis/app/controller/details/details_controller.dart';
import 'package:flutter_graduation_thesis/app/data/provider/api.dart';
import 'package:flutter_graduation_thesis/app/data/repository/posts_repository.dart';
import 'package:http/http.dart' as http;

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
