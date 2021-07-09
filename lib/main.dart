import 'package:app_lovepeople/model/user_repository.dart';
import 'package:app_lovepeople/presenter/cadastro_controller.dart';
import 'package:app_lovepeople/presenter/login_controller.dart';
import 'package:app_lovepeople/presenter/todo_controller.dart';
import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'model/Todo_repository.dart';
import 'model/delete_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();
  final TodoRepository todoRepository= TodoRepository();
  final DeleteRepository deleteRepository = DeleteRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CadastroController(userRepository)),
        ChangeNotifierProvider(
            create: (context) => LoginController(userRepository)),
            ChangeNotifierProvider(
            create: (context) => TodoController(todoRepository, deleteRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors
              .purple, // or Colors.green or any color darker than white (this is line 66)
          accentColor: Colors.black,
        ),
        home: Listing(),
      ),
    );
  }
}
