import 'package:app_lovepeople/presenter/cadastro_controller.dart';
import 'package:app_lovepeople/view/componentes/olho_icons.dart';
import 'package:app_lovepeople/view/lista-tarefas/listing.dart';
import 'package:app_lovepeople/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaoController = TextEditingController();
  bool _enableObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA901F7),
      body: Consumer<CadastroController>(builder: (context, controller, _) {
        return Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      'Vamos começar!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Montserrat-SemiBold"),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _nomeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Esse campo é obrigatório!";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: "Nome",
                                  hintStyle:
                                      TextStyle(color: Color(0xFF3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Esse campo é obrigatório!";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintText: "Número de telefone, email ou CPF",
                                  hintStyle:
                                      TextStyle(color: Color(0xFF3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _senhaController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Esse campo é obrigatório!";
                                }
                              },
                              obscureText: _enableObscure,
                              decoration: InputDecoration(
                                  suffixIcon: _buildSuffixPassword(),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: "Senha",
                                  hintStyle:
                                      TextStyle(color: Color(0xFF3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _confirmacaoController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Esse campo é obrigatório!";
                                }
                                if (_senhaController.text ==
                                    _confirmacaoController.text) {
                                  return null;
                                } else {
                                  return "Confirmação de senha invalida";
                                }
                              },
                              obscureText: _enableObscure,
                              decoration: InputDecoration(
                                  suffixIcon: _buildSuffixPassword(),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: "Confirmar senha",
                                  hintStyle:
                                      TextStyle(color: Color(0xFF3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF3101B9)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side:
                                      BorderSide(color: Colors.white, width: 2),
                                )),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  controller.cadastrar(
                                      _nomeController.text,
                                      _emailController.text,
                                      _senhaController.text, () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Listing()));
                                  }, () {
                                    _showError();
                                  });
                                }
                              },
                              child: Container(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Montserrat-SemiBold"),
                                  ),
                                ),
                              ),
                            ),
                            if (controller.loading)
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
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
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já possui cadastro? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.yellow),
                          ),
                          onTap: () {
                            redirectToLogin(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _buildSuffixPassword() {
    return IconButton(
        icon: Icon(_enableObscure ? Olho.olho : Olho.olho),
        onPressed: () {
          setState(() {
            _enableObscure = !_enableObscure;
          });
        });
  }

  void redirectToLogin(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Não possivel realizar cadastro',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  // _incrementCounter() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int counter = (prefs.getInt('counter') ?? 0) + 1;
  //   print('Pressed $counter times.');
  //   await prefs.setInt('counter', counter);
  // }
}
