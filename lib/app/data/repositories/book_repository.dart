import 'dart:convert';

import 'package:bookapp/app/data/http/exceptions.dart';
import 'package:bookapp/app/data/http/http_client.dart';
import 'package:bookapp/app/data/models/book_model.dart';

abstract class IBookRepository {
  Future<List<BookModel>> getBooks();
}

class BookRepository implements IBookRepository {
  final IHttpCliente client;

  BookRepository({required this.client});

  @override
  Future<List<BookModel>> getBooks() async {
    final response = await client.get(
        url: 'https://book-api-alpha.azurewebsites.net/api/Books');

    if (response.statusCode == 200) {
      final List<BookModel> books = [];

      final body = jsonDecode(response.body);

      body[''].map((item) {
        final BookModel book = BookModel.fromMap(item, map: {});
        books.add(book);
      }).toList();

      return books;
    } else if (response.statusCode == 404) {
      throw NotFoundExeption("A URL informada não é valida");
    } else {
      throw Exception('Não foi possível carregar os livros');
    }
  }
}
