import 'package:app_lovepeople/presenter/todo_controller.dart';
import 'package:app_lovepeople/view/lista-tarefas/listingwidget.dart';
import 'package:app_lovepeople/view/nova-tarefa/nova_tarefa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listing extends StatefulWidget {
  @override
  _ListingState createState() => _ListingState();
}

void postFrame(Null Function() param0) {}

class _ListingState extends State<Listing> {
  @override
  void initState() {
    postFrame(() {
      context.read<TodoController>().getTasks("");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAA00FF),
      body: Consumer<TodoController>(builder: (_, controller, child) {
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
              _buildSearch(),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.tarefasList.length,
                    itemBuilder: (context, index) {
                      return ListingWidget(
                        item: controller.tarefasList[index],
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 80,
        margin: EdgeInsets.only(bottom: 40),
        child: IconButton(
          icon: const Icon(Icons.add_rounded),
          color: Colors.white,
          iconSize: 85,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NovaTarefa(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  _buildSearch() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: TextField(
        onChanged: (text) {
        
          
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
}

_buildAlert() {
  return Container(
    margin: EdgeInsets.only(top: 70, left: 50),
    child: Text(
      "Não há itens cadastrados.",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        wordSpacing: 1,
        fontFamily: "Montserrat",
        fontSize: 25,
        color: Colors.white,
      ),
    ),
  );
}
