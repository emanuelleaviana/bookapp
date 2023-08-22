import 'package:bookapp/app/data/http/exceptions.dart';
import 'package:bookapp/app/data/models/book_model.dart';
import 'package:bookapp/app/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';

class BookStore {
  final IBookRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<BookModel>> state =
      ValueNotifier<List<BookModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier('');

  BookStore({required this.repository});

  Future getBooks() async {
    isLoading.value = true;

    try {
      final result = await repository.getBooks();
      state.value = result;
    } on NotFoundExeption catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
