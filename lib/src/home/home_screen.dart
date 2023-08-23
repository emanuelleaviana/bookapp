import 'package:bookapp/app/data/models/book_model.dart';
import 'package:bookapp/app/data/repositories/book_repository.dart';
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
              const SizedBox(height: 20),
              SizedBox(
                height: 64,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDA4C66),
                    ),
                    child: const Text(
                      'Começar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () async {
                      var response = await BookRepository()
                          .get('/Books')
                          .catchError((err) {});
                      if (response == null) return;
                      debugPrint('successful:');

                      var books = bookFromJson(response);
                      debugPrint('Books account:' + books.length.toString());

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ListScreen()));
                    }),
              ),
            ])));
  }
}
