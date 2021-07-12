import 'package:app_lovepeople/core/functions.dart';
import 'package:app_lovepeople/model/login_user.dart';
import 'package:app_lovepeople/model/repository/todo_repository.dart';
import 'package:app_lovepeople/model/todo.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  final TodoRepository _repository;

  HomeController(this._repository);

  List<Todo> tarefaList = [];
  List<Todo> _originalList = [];
  bool loading = false;
  LoginResponse? login;

  void filter(String keyWord) {
    tarefaList = _originalList
        .where((element) =>
            element.title!.toLowerCase().contains(keyWord.toLowerCase()) ||
            element.description!.toLowerCase().contains(keyWord.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void loadTasks() async {
    _showLoading(true);
    _repository.getTasks().then((value) {
      tarefaList = value;
      _originalList = value;
    }).whenComplete(() {
      _showLoading(false);
    });
  }

  void delete(Todo todo) {
    _showLoading(true);
    _repository.delete(todo.id ?? 0).then((value) {
      if (value != null) {
        tarefaList.remove(todo);
      }
    }).whenComplete(() {
      _showLoading(false);
    });
  }

  void _showLoading(bool show) {
    postFrame(() {
      loading = show;
      notifyListeners();
    });
  }
}
