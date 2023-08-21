import 'package:bookapp/src/home/list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFF78376),
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
            top: 60,
            left: 40,
            right: 40,
          ),
          color: const Color(0xFFF3B578),
          child: ListView(children: <Widget>[
            const Text(
              textAlign: TextAlign.center,
              "A sua biblioteca em uma API.",
              style: TextStyle(
                color: Color(0xFF3F3557),
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const Text(
              "Feita de Dev para Devs",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3F3557),
                fontSize: 16,
              ),
            ),
            SizedBox(
              child: Image.asset(
                'images/books.png',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ListScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 10,
                ),
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFFDA4C66),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Começar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
