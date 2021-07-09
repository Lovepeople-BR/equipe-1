import 'package:app_lovepeople/core/functions.dart';
import 'package:app_lovepeople/model/login_user.dart';
import 'package:app_lovepeople/model/repository/todo_repository.dart';
import 'package:app_lovepeople/model/repository/user_repository.dart';
import 'package:app_lovepeople/model/todo.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  final TodoRepository _repository;
  final UserRepository _userRepository;

  HomeController(this._repository, this._userRepository);

  List<Todo> tarefaList = [];
  List<Todo> _originalList = [];
  bool loading = false;
  LoginResponse? login;

  void filter(String keyWord) {
    tarefaList = _originalList
        .where((element) =>
            element.title!.contains(keyWord) ||
            element.description!.contains(keyWord))
        .toList();
    notifyListeners();
  }

  void loadTasks() async {
    _showLoading(true);

    login = await _userRepository.getLogin();

    _repository.getTasks().then((value) {
      tarefaList = value;
    }).whenComplete(() {
      _showLoading(false);
    });
  }

  void delete(Todo todo) {
    _showLoading(true);
    _repository.delete(todo.id).then((value) {
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
