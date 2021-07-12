import 'dart:io';
import 'package:app_lovepeople/globals.dart';
import 'package:app_lovepeople/model/repository/todo_repository.dart';
import 'package:app_lovepeople/model/repository/user_repository.dart';
import 'package:app_lovepeople/presenter/cadastro_controller.dart';
import 'package:app_lovepeople/presenter/home_controller.dart';
import 'package:app_lovepeople/presenter/login_controller.dart';
import 'package:app_lovepeople/presenter/new_todo_controller.dart';
import 'package:app_lovepeople/view/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'core/local_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const URL_BASE_API = 'https://todo-lovepeople.herokuapp.com';
  final preferences = LocalPreferences();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
            value: TodoRepository(
          URL_BASE_API,
        )),
        Provider.value(value: UserRepository(URL_BASE_API, preferences)),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => NewTodoController(context.read())),
          ChangeNotifierProvider(
              create: (context) => CadastroController(context.read())),
          ChangeNotifierProvider(
              create: (context) => LoginController(context.read())),
          ChangeNotifierProvider(
            create: (context) => HomeController(
              context.read(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors
                .purple, // or Colors.green or any color darker than white (this is line 66)
            accentColor: Colors.black,
          ),
          home: Login(),
        ),
      ),
    );
  }
}
