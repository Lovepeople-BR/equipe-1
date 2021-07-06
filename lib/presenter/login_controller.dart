import 'package:app_lovepeople/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_lovepeople/globals.dart' as globals;

class LoginController extends ChangeNotifier {
  final UserRepository repository;
  LoginController(this.repository);

  void login(
      String email, String senha, VoidCallback sucesso, VoidCallback falha) {
    repository.login(email, senha).then((value) {
      if (value != null) {
        globals.token = value.jwt!;
        sucesso();
      } else {
        falha();
      }
    });
  }
}
