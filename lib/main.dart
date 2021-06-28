import 'package:app_lovepeople/view/nova-tarefa/tarefas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NovaTarefa(),
    );
  }
}
