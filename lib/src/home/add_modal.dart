import 'package:bookapp/app/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/data/models/book_model.dart';

class AddModal extends StatefulWidget {
  @override
  _AddModalState createState() => _AddModalState();
}

class _AddModalState extends State<AddModal> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _idController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _idController.dispose();
    super.dispose();
  }

  bool _areAllFieldsFilled = false;

  void _checkFieldsFilled() {
    setState(() {
      _areAllFieldsFilled = _titleController.text.isNotEmpty &&
          _authorController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _idController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 40,
          right: 40,
          bottom: 10,
        ),
        color: const Color(0xFF8F3C68),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom + 10, // Adicione isso
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Preencha as informações do seu livro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (_) => _checkFieldsFilled(),
                    ),
                    TextFormField(
                      controller: _authorController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Autor',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (_) => _checkFieldsFilled(),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (_) => _checkFieldsFilled(),
                    ),
                    TextFormField(
                      controller: _idController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (_) => _checkFieldsFilled(),
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly 
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _areAllFieldsFilled
                      ? () async {
                          // Se todos os campos estiverem preenchidos, continue com a ação
                          var book = Book(
                            id: _idController.text,
                            title: _titleController.text,
                            author: _authorController.text,
                            description: _descriptionController.text,
                          );
                          var response = await BookRepository()
                              .post('/Books', book)
                              .catchError((err) {});
                          if (response == null) return;
                          debugPrint('successful:');

                          Navigator.pop(context);
                        }
                      : null, // Desative o botão se nem todos os campos estiverem preenchidos
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDA4C66)),
                  ),
                  child: const Text('Confirmar'),
                ),
              ),
            ],
          ),
        ));
  }
}
