import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_user.dart';

class UserRepository {
  Future<LoginUser?> cadastrar(String nome, String email, String senha) {
    final body = {'username': nome, 'email': email, 'password': senha};

    return http
        .post(
      Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register'),
      body: body,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('LoginUser', value.body);

        //String? body = prefs.getString(
        //  'LoginUser',
        // );  transformar num json

        final json = jsonDecode(value.body);
        return LoginUser.fromJson(json);
      } else {
        return null;
      }
    });
  }

  login() {}
}
