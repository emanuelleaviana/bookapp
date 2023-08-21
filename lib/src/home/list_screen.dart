import 'package:bookapp/src/home/modal_edit.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFF78376),
            leading: IconButton(
              icon: Image.asset('images/home-icon.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Image.asset(
                'images/github-icon.png',
              ),
            ],
            centerTitle: true,
            title: const Text(
              'Book API',
              style: TextStyle(
                color: Color(0xFF3F3557),
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Container(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            color: const Color(0xFFF3B578),
            child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                color: const Color(0xFFF78376),
                child: Column(children: <Widget>[
                  Card(
                      color: const Color(0xFF3F3557),
                      child: Column(
                        children: <Widget>[
                          const ListTile(
                            title: Text(
                              'As aventuras de Tim Tim',
                              style: TextStyle(
                                fontSize: 20, // Tamanho do título
                              ),
                            ),
                            subtitle: Text('Hergé'),
                            textColor: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'Um dos grandes clássicos da literatura brasileira conta a história de Bentinho e Capitu, um casal que se conhece na adolescencia...',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(onTap: () {
                                  
                                }),
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  height: 30,
                                  width: 140,
                                  color: const Color(0xFFFF5454),
                                  child: const Center(
                                    child: Text(
                                      "Excluir",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    height: 30,
                                    width: 130,
                                    color: const Color(0xFFDA4C66),
                                    child: const Center(
                                      child: Text(
                                        "Editar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ])
                        ],
                      )),
                ]))));
  }
}
