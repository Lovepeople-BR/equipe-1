import 'dart:convert';
import 'dart:io';

import 'package:app_lovepeople/core/local_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_lovepeople/globals.dart' as globals;

import '../login_user.dart';

class UserRepository {

  final String baseUrl;
  final LocalPreferences _localPreferences;
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer ${globals.token}',
  };

  UserRepository(this.baseUrl, this._localPreferences);

 

  Future<LoginResponse?> cadastrar(String nome, String email, String senha) {
    final body = {'username': nome, 'email': email, 'password': senha};

    return http
        .post(
      Uri.parse('$baseUrl/auth/local/register'),
      body: body,
      headers: header
    )
        .then((value) async {
      if (value.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('LoginUser', value.body);

        //String? body = prefs.getString(
        //  'LoginUser',
        // );  transformar num json

        final json = jsonDecode(value.body);
        return LoginResponse.fromJson(json);
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
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('LoginUser', value.body);

        final json = jsonDecode(value.body);
        return LoginResponse.fromJson(json);
      } else {
        return null;
      }
    });
  }

 
}
