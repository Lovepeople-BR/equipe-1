import 'package:app_lovepeople/model/user_repository.dart';
import 'package:app_lovepeople/presenter/cadastro_controller.dart';
import 'package:app_lovepeople/view/cadastro/cadastro.dart';
import 'package:app_lovepeople/view/cadastro/cadastro_secundario.dart';
import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:app_lovepeople/view/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_lovepeople/view/nova-tarefa/nova_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CadastroController(userRepository))
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

    );
  }
}
