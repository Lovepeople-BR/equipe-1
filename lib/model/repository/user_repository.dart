import 'dart:convert';
import 'dart:io';

import 'package:app_lovepeople/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../login_user.dart';

class UserRepository {
  final String baseUrl;
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
  };

  UserRepository(this.baseUrl);

  Future<LoginResponse?> cadastrar(String nome, String email, String senha) {
    final body = {'username': nome, 'email': email, 'password': senha};

    return http
        .post(Uri.parse('$baseUrl/auth/local/register'),
            body: body, headers: header)
        .then((value) async {
      if (value.statusCode == 200) {
        final json = jsonDecode(value.body);
        final login = LoginResponse.fromJson(json);

        Globals.token = login.jwt ?? '';
        return login;
      } else {
        return null;
      }
    });
  }

  Future<LoginResponse?> login(String email, String senha) {
    final body = {'identifier': email, 'password': senha};

    return http
        .post(
      Uri.parse('$baseUrl/auth/local'),
      body: body,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        final json = jsonDecode(value.body);
        final login = LoginResponse.fromJson(json);

        Globals.token = login.jwt ?? '';
        return login;
      } else {
        return null;
      }
    });
  }
}
