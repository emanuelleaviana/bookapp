import 'package:bookapp/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/data/models/book_model.dart';
import '../modals/add_modal.dart';
import '../modals/custom_card.dart';

void _openModalAdd(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AddModal();
    },
  );
}

class ListScreen extends StatefulWidget {
  List<Book> books;

  ListScreen({required this.books, Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isLoading = false;

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await BookRepository().get('/Books');
      if (response != null) {
        setState(() {
          widget.books = bookFromJson(response);
        });
      }
    } catch (error) {
      debugPrint('Erro ao buscar livros: $error');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        height: MediaQuery.of(context).size.height * 1,
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          right: 30,
          bottom: 10,
        ),
        color: const Color(0xFFF3B578),
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: const Color(0xFFF78376),
                  child: ListView.builder(
                    itemCount: widget.books.length,
                    itemBuilder: (context, index) {
                      final book = widget.books[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 25.0,
                        ),
                        child: CustomCard(
                          id: book.id!,
                          title: book.title!,
                          author: book.author!,
                          description: book.description!,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8F3C68),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  _openModalAdd(context);
                },
                child: const Text(
                  'Adicionar livro +',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
