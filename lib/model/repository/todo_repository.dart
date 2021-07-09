import 'package:app_lovepeople/core/local_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../todo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_lovepeople/main.dart';

class TodoRepository {
  final LocalPreferences _localPreferences;
  final String baseUrl;

  TodoRepository(
    this.baseUrl,
    this._localPreferences,
  );

  Future<List<Todo>> getTasks(String title, {BuildContext? context}) async {
    var response = await http.get(Uri.parse('$baseUrl/todos'), headers: header);
    if (response.statusCode == 200) {
      var json = JsonDecoder().convert(response.body);

      return json.map<dynamic>((item) {
        return Todo.fromJson(item);
      }).toList();
    } else {
      return [];
    }
  }

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

  Future<Todo?> register(Todo todo) async {
    final login = await _localPreferences.getLogin();
    header = {
      'Authorization': 'Bearer ${login?.jwt}',
    };
    return http
        .post(Uri.parse('$baseUrl/todos'), headers: header, body: todo.toJson())
        .then((value) async {
      if (value.statusCode == 200) {
        final json = jsonDecode(value.body);
        return Todo.fromJson(json);
      } else {
        return null;
      }
    });
  }
}
