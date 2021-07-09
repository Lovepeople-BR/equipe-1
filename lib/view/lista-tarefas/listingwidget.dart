import 'package:app_lovepeople/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'delete.dart';

class ListingWidget extends StatelessWidget {
  final Todo item;
  const ListingWidget({Key? key, required this.item, onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            "assets/Group.png",
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
