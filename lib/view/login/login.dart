import 'package:app_lovepeople/core/functions.dart';
import 'package:app_lovepeople/presenter/login_controller.dart';
import 'package:app_lovepeople/view/cadastro/cadastro.dart';
import 'package:app_lovepeople/view/componentes/olho_icons.dart';
import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _enableObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA901F7),
      body: Consumer<LoginController>(builder: (context, controller, _) {
        return Column(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 5),
                      child: Text(
                        'Que bom que voltou!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          height: 4,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "Este campo é obrigatório!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11)),
                                  ),
                                  hintText: 'Número de telefone, email ou CPF',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 0, right: 0),
                                child: TextFormField(
                                  controller: _senhaController,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length == 0) {
                                      return "Este campo é obrigatório!";
                                    }
                                    return null;
                                  },
                                  obscureText: _enableObscure,
                                  decoration: InputDecoration(
                                    suffixIcon: _buildSuffixPasswordLogin(),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                    ),
                                    hintText: "Senha",
                                    hintStyle:
                                        TextStyle(color: Color(0xFF3101B9)),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3, top: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Esqueceu seu login ou senha? ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'tahoma'),
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Clique aqui',
                                        style: TextStyle(
                                            fontFamily: 'Tahoma',
                                            color: Color(0xFFFFD600)),
                                      ),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(45),
                                child: Container(
                                  height: 40,
                                  width: 107,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ==
                                          true) {
                                        controller.login(_emailController.text,
                                            _senhaController.text, () {
                                          print('fallen');
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Listing()));
                                        }, () {
                                          _showError();
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Montserrat-SemiBold"),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF3101B9)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: Colors.white,
                                                    width: 1)))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            if (controller.loading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      }),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Não possui cadastro? ',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontFamily: 'tahoma'),
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Clique aqui',
                      style: TextStyle(
                          fontFamily: 'Tahoma', color: Color(0xFFFFD600)),
                    ),
                  ),
                  onTap: () {
                    redirectToCadastro(context);
                  },
                ),
              ],
            ),
          ),
        ],
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

  void redirectToList() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Listing(),
      ),
    );
  }

  void redirectToCadastro(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Cadastro(),
      ),
    );
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Email ou senha invalidos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
