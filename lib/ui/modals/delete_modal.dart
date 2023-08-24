import 'package:flutter/material.dart';
import 'package:bookapp/data/repositories/book_repository.dart';

class DeleteModal extends StatefulWidget {
  final int cardId;

  const DeleteModal({required this.cardId, Key? key}) : super(key: key);

  @override
  _DeleteModalState createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {
  bool _isLoading = false;

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
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                        });

                        var response = await BookRepository()
                            .delete(
                                '/Books/${widget.cardId}') // Access cardId through widget
                            .catchError((err) {});

                        if (response == null) {
                          setState(() {
                            _isLoading = false;
                          });
                          return;
                        }

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFFFF5454),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Sim'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        Navigator.pop(context);
                      },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                     const Color(0xFFDA4C66),
                  ),
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
