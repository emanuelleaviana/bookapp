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

void _openModalDelete(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DeleteModal();
    },
  );
}

void _openModalEdit(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return EditModal();
    },
  );
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF3F3557),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text(
              'Dom Casmurro',
              style: TextStyle(
                fontSize: 20, // Tamanho do título
              ),
            ),
            subtitle: Text('Hergé'),
            textColor: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Um dos grandes clássicos da literatura brasileira conta a história de Bentinho e Capitu, um casal que se conhece na adolescencia...',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    _openModalDelete(
                        context); // Chama a função para abrir o modal
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
                    _openModalEdit(context);
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