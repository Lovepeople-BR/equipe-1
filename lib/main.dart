<<<<<<< HEAD
import 'package:app_lovepeople/view/cadastro/cadastro.dart';
=======

import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:flutter/cupertino.dart';

import 'package:app_lovepeople/view/nova-tarefa/tarefas.dart';

>>>>>>> main
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      home: Cadastro(),
=======

      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors
            .purple, // or Colors.green or any color darker than white (this is line 66)
        accentColor: Colors.black,
      ),
      home: Listing(),



>>>>>>> main
    );
  }
}
