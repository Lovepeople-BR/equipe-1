import 'package:app_lovepeople/globals.dart';
import '../todo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRepository {
  final String baseUrl;

  TodoRepository(
    this.baseUrl,
  );

  Future<List<Todo>> getTasks() async {
    return http
        .get(Uri.parse('$baseUrl/todos'), headers: Globals.headerWithToken)
        .then((value) async {
      if (value.statusCode == 200) {
        List json = jsonDecode(value.body);
        return json.map((e) => Todo.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }

  Future<Todo?> delete(int todoId) async {
    return http
        .delete(
      Uri.parse('$baseUrl/todos/$todoId'),
      headers: Globals.headerWithToken,
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
    return http
        .post(
      Uri.parse('$baseUrl/todos'),
      headers: Globals.headerWithToken,
      body: todo.toJson(),
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
}
