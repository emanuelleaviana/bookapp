import 'package:bookapp/app/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';

class DeleteModal extends StatelessWidget {
  final int cardId;

  const DeleteModal({required this.cardId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
        bottom: 30,
      ),
      color: const Color(0xFF8F3C68),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Tem certeza que deseja remover esse livro da biblioteca?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var response = await BookRepository()
                      .delete('/Books/$cardId')
                      .catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFF5454)),
                ),
                child: const Text('Sim'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFDA4C66)),
                ),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
