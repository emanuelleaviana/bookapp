import 'package:bookapp/data/models/book_model.dart';
import 'package:bookapp/data/repositories/book_repository.dart';
import 'package:flutter/material.dart';

class EditModal extends StatefulWidget {
  final String id;
  final String initialTitle;
  final String initialAuthor;
  final String initialDescription;

  const EditModal({
    required this.id,
    required this.initialTitle,
    required this.initialAuthor,
    required this.initialDescription,
  });

  @override
  _EditModalState createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _authorController = TextEditingController(text: widget.initialAuthor);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

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
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Edite as informações do seu livro!',
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
                    ),
                    TextFormField(
                      controller: _authorController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Autor',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      maxLines: null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() {
                            _isLoading = true;
                          });

                          var updatedTitle = _titleController.text;
                          var updatedAuthor = _authorController.text;
                          var updatedDescription = _descriptionController.text;

                          var updatedBook = Book(
                            id: widget.id,
                            title: updatedTitle,
                            author: updatedAuthor,
                            description: updatedDescription,
                          );

                          var response = await BookRepository()
                              .put('/Books?id=${widget.id}', updatedBook)
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
                      const Color(0xFFDA4C66),
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
                      : const Text('Confirmar'),
                ),
              ),
            ],
          ),
        ));
  }
}
