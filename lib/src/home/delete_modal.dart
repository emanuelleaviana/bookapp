import 'package:flutter/material.dart';

class DeleteModal extends StatelessWidget {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Deseja excluir?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Coloque aqui a lógica para a opção "Sim"
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFDA4C66)),
                ),
                child: const Text('Sim'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Coloque aqui a lógica para a opção "Não"
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFDA4C66)),
                ),
                child: const Text('Não'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
