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
                Navigator.pop(context); // Ação ao pressionar o botão de voltar
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Book API',
                  style: TextStyle(
                    color: Color(0xFF3F3557),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'images/github-icon.png',
                ),
              ],
            )),
        body: Container(
            padding: const EdgeInsets.only(
              top: 30,
              left: 40,
              right: 40,
            ),
            color: const Color(0xFFF3B578),
            child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 40,
                  right: 40,
                ),
                color: const Color(0xFFF78376),
                child: const Column(children: <Widget>[
                  Card(
                      color: Color(0xFF3F3557),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text('Dom Casmurro'),
                            subtitle: Text('Machado de Assis'),
                            contentPadding: EdgeInsets.all(16),
                            textColor: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Um dos grandes clássicos da literatura brasileira...',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              
                            ),
                          ),
                        ],
                      )),
                ]))));
  }
}
