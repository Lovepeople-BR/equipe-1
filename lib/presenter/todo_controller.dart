import 'package:app_lovepeople/model/Todo_repository.dart';
import 'package:app_lovepeople/model/delete_repository.dart';
import 'package:app_lovepeople/model/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoController extends ChangeNotifier {
  final TodoRepository _api;
  final DeleteRepository delete;

  TodoController(this._api, this.delete);

  List<Todo> tarefasList = [];
  List<Todo> _originalList = [];

  void getTasks(String title, {BuildContext? context}) async {
    print('Controller');
    var response = await _api.getTasks(title);
    tarefasList.clear();
    _originalList.clear();
    tarefasList.addAll(response);
    _originalList.addAll(response);

    notifyListeners();
  }

  void filter(String keyWord) {
    tarefasList = _originalList
        .where((element) =>
            element.title!.contains(keyWord) ||
            element.description!.contains(keyWord))
        .toList();
    notifyListeners();
  }

  void deleteItem(Todo todo) {
    delete.deleteItem(todo.id).then((value) {
      if (value == null) {
        tarefasList.remove(todo);
        notifyListeners();
      }
    });
  }
}
