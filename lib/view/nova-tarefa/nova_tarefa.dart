import 'package:flutter/material.dart';

class NovaTarefa extends StatelessWidget {
  final _cores = ['FFF2CC', 'FFD9F0', 'E8C5FF', 'CAFBFF', 'E3FFE6'];
  final _formKey = GlobalKey<FormState>();
  //const NovaTarefa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA901F7),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'Nova Tarefa',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 17, color: Colors.indigo[900]),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            hintText: ('Título da Tarefa'),
                            filled: true,
                            fillColor: Colors.white,
                          )),
                          Padding(padding: const EdgeInsets.only(top: 14)),
                          TextFormField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.indigo[900]),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                hintText:
                                    ('Escreva uma descrição para sua tarefa'),
                                filled: true,
                                fillColor: Colors.white,
                              )),
                          Container(
                            child: buildListView(),
                            margin: EdgeInsets.only(top: 40),
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 13, top: 14),
              child: Image.asset(
                'assets/logo_lovepeople.png',
                height: 50,
                width: 50,
              ),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/botton_cancel.png',
                width: 35,
                height: 35,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/botton_confirm.png',
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cores.length,
        itemBuilder: (context, index) {
          final colorButton = '0xFF${_cores[index]}';
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Color(int.parse(colorButton))),
            onPressed: () {},
            child: SizedBox(
              width: 20,
            ),
          );
        });
  }
}
