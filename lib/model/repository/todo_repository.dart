import 'package:app_lovepeople/core/local_preferences.dart';
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

  Future<List<Todo>> getTasks() async {
    final login = await _localPreferences.getLogin();
    Map<String, String> header = {
      'Authorization': 'Bearer ${login?.jwt}',
    };
    return http
        .get(Uri.parse('$baseUrl/todos'), headers: header)
        .then((value) async {
      if (value.statusCode == 200) {
        List json = jsonDecode(value.body);
        return json.map((e) => Todo.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }

  Future<Todo?> delete(int? todoId) async {
    final login = await _localPreferences.getLogin();
    Map<String, String> header = {
      'Authorization': 'Bearer ${login?.jwt}',
    };
    return http
        .delete(
      Uri.parse('$baseUrl/todos/$todoId'),
      headers: header,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        final json = jsonDecode(value.body);
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
