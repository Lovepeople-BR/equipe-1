import 'dart:convert';
import 'dart:io';

import 'package:app_lovepeople/model/todo.dart';
import 'package:http/http.dart' as http;
import 'package:app_lovepeople/globals.dart' as globals;

class DeleteRepository {
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer ${globals.token}',
  };

  Future<Todo?> deleteItem(int? id) async {
    await http
        .delete(
      Uri.parse('https://todo-lovepeople.herokuapp.com/todos/ /todos/{idTodo}'),
      headers: header,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        var json = JsonDecoder().convert(value.body);
        return Todo.fromJson(json);
      } else {
        return null;
      }
    });
  }
}
