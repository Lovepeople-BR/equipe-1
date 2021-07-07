import 'package:app_lovepeople/model/repository/todo_repository.dart';

import 'package:app_lovepeople/model/todo.dart';
import 'package:flutter/material.dart';

class NewTodoController extends ChangeNotifier {
  final TodoRepository repository;
  
  NewTodoController(this.repository,);

  void registerTodo(
      Todo todo, VoidCallback sucesso, VoidCallback falha) {
    repository.register(todo).then((value) {
      if (value != null) {
        sucesso.call();
      } else {
        falha.call();
      }
    });
  }
}
