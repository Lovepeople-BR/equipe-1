import 'package:app_lovepeople/core/functions.dart';
import 'package:app_lovepeople/model/todo.dart';
import 'package:app_lovepeople/presenter/home_controller.dart';
import 'package:app_lovepeople/view/nova-tarefa/nova_tarefa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  @override
  void initState() {
    postFrame(() {
      context.read<HomeController>().loadTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAA00FF),
      body: Consumer<HomeController>(builder: (_, controller, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(100)),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/corujaada.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Suas listagens',
                    style: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildSearch(controller),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.tarefaList.length,
                    itemBuilder: (context, index) {
                      final todo = controller.tarefaList[index];
                      return _buildTask(controller, todo);
                    }),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Consumer<HomeController>(
        builder: (_, controller, child) {
          return Container(
            alignment: Alignment.center,
            height: 80,
            margin: EdgeInsets.only(bottom: 40),
            child: IconButton(
              icon: const Icon(Icons.add_rounded),
              color: Colors.white,
              iconSize: 85,
              onPressed: () {
                _goRegisterTodo(context, controller);
              },
            ),
          );
        },
      ),
    );
  }

  _buildTask(HomeController controller, Todo todo) async {
    return Container(
      height: 120,
      width: 420,
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: _getColor(todo.color),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actionsPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    title: Text(
                      "Atenção",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3101B9),
                          fontFamily: "Tahoma"),
                    ),
                    content: Text(
                      "Deseja excluir a tarefa: ${todo.title} ? ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3101B9),
                          fontFamily: "Tahoma"),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3101B9),
                              fontFamily: "Tahoma"),
                        ),
                        onPressed: () {
                          controller.delete(todo);

                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFAA00FF),
                              fontFamily: "Tahoma"),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    elevation: 24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white, width: 0.0),
                    ),
                  );
                });
          },
          child: Image.asset(
            "assets/Group.png",
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}

@override
_buildSearch(HomeController controller) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(left: 30, right: 30),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: TextField(
      onChanged: (text) {
        controller.filter(text);
      },
      decoration: InputDecoration(
        labelText: 'Busque palavras-chave',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: Icon(
          Icons.search,
          color: Color(0xFF3101B9),
        ),
        labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3101B9),
            fontFamily: "Tahoma"),
      ),
    ),
  );
}

@override
void _goRegisterTodo(BuildContext context, HomeController controller) async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => NovaTarefa(),
    ),
  );

  if (result != null) {
    controller.loadTasks();
  }
}

Color _getColor(String? color) {
  try {
    return Color(int.parse('0xFF${color?.replaceAll('#', '')}'));
  } catch (e) {
    return Colors.transparent;
  }
}
