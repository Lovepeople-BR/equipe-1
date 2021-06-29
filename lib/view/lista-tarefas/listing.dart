import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'delete.dart';

class Listing extends StatefulWidget {
  final tarefaController = TextEditingController();
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  final List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAA00FF),
      body: SafeArea(
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
                        "assets/images/corujaada.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Sua listagem',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1,
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildSearch(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  _buildTask(context),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTask(context),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTask(context),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 80,
        margin: EdgeInsets.only(bottom: 75),
        child: IconButton(
          icon: const Icon(Icons.add_rounded),
          color: Colors.white,
          iconSize: 85,
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}

@override
_buildTask(BuildContext context) {
  return Container(
    height: 120,
    width: 420,
    margin: EdgeInsets.only(left: 30, right: 30),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Color(0xFFFFF9C4),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Delete(
                cancelar: () {
                  Navigator.of(context).pop();
                },
                confirmar: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: Image.asset(
          "assets/images/Group.png",
          height: 30,
          width: 30,
        ),
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
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Busque por palavras-chave',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: Icon(
          Icons.search,
          color: Color(0xFF3101B9),
          size: 30,
        ),
        labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3101B9),
            fontFamily: "Tahoma"),
      ),
    ),
  );
}

_buildController(BuildContext context) {
  TextEditingController customController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(''),
          content: TextField(
            controller: customController,
          ),
        );
      });
}
