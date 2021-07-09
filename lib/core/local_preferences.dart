import 'dart:convert';

import 'package:app_lovepeople/model/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final loginKey = 'LOGIN_KEY';

  Future<void> saveLogin(LoginResponse login) async {
    final p = await SharedPreferences.getInstance();
    // Transformo em string no formato JSON para salvar
    p.setString(loginKey, jsonEncode(login.toJson()));
  }

  Future<LoginResponse?> getLogin() async {
    final p = await SharedPreferences.getInstance();

    /// obtenho a string JSON do cache e transformo no objeto novamente
    final cache = p.getString(loginKey);
    if (cache != null && cache.isNotEmpty) {
      return LoginResponse.fromJson(jsonDecode(cache));
    }
    return null;
  }

  Future<void> deleteLogin() async {
    final p = await SharedPreferences.getInstance();
    p.setString(loginKey, '');
  }
}
