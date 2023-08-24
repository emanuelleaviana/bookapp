import 'package:flutter/material.dart';
import 'add_modal.dart';
import 'delete_modal.dart';
import 'edit_modal.dart';

void _openModalAdd(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AddModal();
    },
  );
}

void _openModalDelete(BuildContext context, id) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DeleteModal(cardId: id);
    },
  );
}

void _openModalEdit(BuildContext context, id, String title,
    String author, String description) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return EditModal(
        id: id,
        initialTitle: title,
        initialAuthor: author,
        initialDescription: description,
      );
    },
  );
}

class CustomCard extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String description;

  const CustomCard({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF3F3557),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(author),
            textColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    _openModalDelete(context, int.parse(id));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 30,
                    color: const Color(0xFFFF5454),
                    child: const Center(
                      child: Text(
                        "Excluir",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    _openModalEdit(
                      context,
                      id,
                      title,
                      author,
                      description,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 30,
                    color: const Color(0xFFDA4C66),
                    child: const Center(
                      child: Text(
                        "Editar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
