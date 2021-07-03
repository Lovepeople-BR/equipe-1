import 'package:flutter/material.dart';

class CadastroSecundario extends StatefulWidget {
  @override
  _CadastroSecundarioState createState() => _CadastroSecundarioState();
}

class _CadastroSecundarioState extends State<CadastroSecundario> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 200,
                      bottom: 30,
                    ),
                    child: Text(
                      "Cadastro Concluído!",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Montserrat-SemiBold"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Começar",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat-SemiBold"),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF3101B9)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFA901F7),
              ),
            ),
            Container(
              width: 500,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(190),
                  topRight: Radius.circular(190),
                ),
              ),
              child: Container(
                child: Image.asset(
                  'assets/coruja_cadastro.png',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                "Os ventos da programação \n       estão indo até você",
                style: TextStyle(
                  color: Color(0xFF3101B9),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
