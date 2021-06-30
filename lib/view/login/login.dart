import 'package:app_lovepeople/view/cadastro/cadastro.dart';
import 'package:app_lovepeople/view/componentes/olho_icons.dart';
import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _enableObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA901F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 190,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(190),
                      bottomRight: Radius.circular(190))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/logocoruja.png')),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Lovepeople',
                      style: TextStyle(
                        color: Color(0xFF3101B9),
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Que bom que voltou!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat-SemiBold',
                height: 3,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        hintText: 'Número de telefone, email ou CPF',
                        hintStyle: TextStyle(color: Color(0xFF3101B9)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        obscureText: _enableObscure,
                        decoration: InputDecoration(
                          suffixIcon: _buildSuffixPasswordLogin(),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          hintText: "Senha",
                          hintStyle: TextStyle(color: Color(0xFF3101B9)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Esqueceu seu login ou senha? ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'tahoma'),
                        ),
                        InkWell(
                          child: Text(
                            'Clique aqui',
                            style: TextStyle(
                                fontFamily: 'Tahoma', color: Color(0xFFFFD600)),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {
                          redirectToList(context);},
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Montserrat-SemiBold"),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF3101B9)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: Colors.white, width: 1)))),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.white,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não possui cadastro? ',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontFamily: 'tahoma'),
                  ),
                  InkWell(
                    child: Text(
                      'Clique aqui',
                      style: TextStyle(
                          fontFamily: 'Tahoma', color: Color(0xFFFFD600)),
                    ),
                    onTap: () {
                      redirectToCadastro(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

 

  _buildSuffixPasswordLogin() {
    return IconButton(
        icon: Icon(_enableObscure ? Olho.olho : Olho.olho),
        onPressed: () {
          setState(() {
            _enableObscure = !_enableObscure;
          });
        });
  }
   void redirectToList(context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Listing(),
      ),
    );
}
 void redirectToCadastro(context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Cadastro(),
      ),
    );
}
}