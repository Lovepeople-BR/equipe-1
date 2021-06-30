import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delete extends StatelessWidget {
  final VoidCallback? confirmar;
  final VoidCallback? cancelar;

  const Delete({Key? key, this.confirmar, this.cancelar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      title: Text(
        'Deseja deletar este item?',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3101B9),
            fontFamily: "Tahoma"),
      ),
      content: Text(
        '"" será movido para lixeira.',
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
          onPressed: confirmar,
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
          onPressed: cancelar,
        ),
      ],
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.white, width: 0.0),
      ),
    );
  }
}
