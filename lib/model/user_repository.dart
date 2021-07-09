import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_user.dart';
import 'package:app_lovepeople/globals.dart' as globals;

class UserRepository {
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer ${globals.token}',
  };

  // Future<List<dynamic>> todo()async  {
  //   var response = await http.get(Uri.parse('https://todo-lovepeople.herokuapp.com/todos'),headers: header);
  //    if (response.statusCode == 200) {
  //       var json = JsonDecoder().convert(response.body);

  //       return json.map<dynamic>((item) {
  //         return dynamic.fromJson(item);
  //       }).toList();
  //     } else {
  //       return [];
  //     }
  // }

  Future<LoginUser?> cadastrar(String nome, String email, String senha) {
    final body = {'username': nome, 'email': email, 'password': senha};

    return http
        .post(
      Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register'),
      body: body,
      headers: header
    )
        .then((value) async {
      if (value.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('LoginUser', value.body);

        final json = jsonDecode(value.body);
        return LoginUser.fromJson(json);
      } else {
        return null;
      }
    });
  }

  Future<LoginUser?> login(String email, String senha) {
    final body = {'identifier': email, 'password': senha};

    return http
        .post(
      Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local'),
      body: body,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('LoginUser', value.body);

        final json = jsonDecode(value.body);
        return LoginUser.fromJson(json);
      } else {
        return null;
      }
    });
  }
}
