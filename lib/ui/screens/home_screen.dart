import 'package:bookapp/data/models/book_model.dart';
import 'package:bookapp/data/repositories/book_repository.dart';
import 'package:bookapp/ui/screens/list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

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
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      var response = await BookRepository()
                          .get('/Books')
                          .catchError((err) {});
                      if (response == null) {
                        setState(() {
                          isLoading = false;
                        });
                        return;
                      }
                      var books = bookFromJson(response);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListScreen(books: books),
                      ));

                      setState(() {
                        isLoading = false; 
                      });
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Começar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                  )),
            ])));
  }
}
