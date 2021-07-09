import 'dart:convert';
import 'package:app_lovepeople/core/local_preferences.dart';
import 'package:app_lovepeople/model/todo.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class DeleteRepository {
  final LocalPreferences _localPreferences;
  final String baseUrl;

  DeleteRepository(
    this.baseUrl,
    this._localPreferences,
  );

  Future<Todo?> deleteItem(int? id) async {
    await http
        .delete(
      Uri.parse('$baseUrl/todos/ /todos/{idTodo}'),
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