import 'package:app_lovepeople/core/functions.dart';
import 'package:app_lovepeople/model/repository/user_repository.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final UserRepository repository;

  bool loading = false;
  LoginController(this.repository);

  void login(
      String email, String senha, VoidCallback sucesso, VoidCallback falha) {
    _showLoading(true);
    repository.login(email, senha).then((value) {
      if (value != null) {
        sucesso.call();
      } else {
        falha.call();
      }
    }).catchError((error) {
      falha.call();
    }).whenComplete(() {
      _showLoading(false);
    });
  }

  void verifyLogin(VoidCallback authenticated) {
    _showLoading(true);
    repository.getLogin().then((value) {
      if (value != null) {
        authenticated();
      }
    }).whenComplete(() {
      _showLoading(false);
    });
  }

  void _showLoading(bool show) {
    postFrame(() {
      loading = show;
      notifyListeners();
    });
  }
}
