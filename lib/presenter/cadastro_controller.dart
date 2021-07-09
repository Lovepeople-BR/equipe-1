import 'package:app_lovepeople/model/repository/user_repository.dart';
import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier {
  final UserRepository repository;
  CadastroController(this.repository);

  void cadastrar(String nome, String email, String senha, VoidCallback sucesso,
      VoidCallback falha) {
    repository.cadastrar(nome, email, senha).then((value) {
      if (value != null) {
        sucesso();
      } else {
        falha();
      }
    });
  }
}
