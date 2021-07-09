import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:app_lovepeople/globals.dart' as globals;
import 'package:app_lovepeople/model/todo.dart';

class TodoRepository {
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer ${globals.token}',
  };


  Future<List<Todo>> getTasks(String title, {BuildContext? context}) async {
    var response = await http.get(
        Uri.parse('https://todo-lovepeople.herokuapp.com/todos'),
        headers: header);
    if (response.statusCode == 200) {
      var json = JsonDecoder().convert(response.body);

      return json.map<dynamic>((item) {
        return Todo.fromJson(item);
      }).toList();
    } else {
      return [];
    }
  }
}
