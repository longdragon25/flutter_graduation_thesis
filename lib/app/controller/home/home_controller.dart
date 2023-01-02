import 'package:get/get.dart';
import 'package:flutter_graduation_thesis/app/data/model/model.dart';
import 'package:flutter_graduation_thesis/app/data/repository/posts_repository.dart';
import 'package:flutter_graduation_thesis/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository}) : assert(repository != null);

  RxList<MyModel> _postsList = RxList();
  get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;

  final _post = MyModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;

  getAll() {
    repository.getAll().then((data) {
      this.postList = data;
    });
  }

  RxInt selectedIndex = 0.obs;

  adicionar(post) {}
  //dismissible
  excluir(id) {}
  //dismissible
  editar() {}
}
