import 'package:flutter/material.dart';
import 'add_modal.dart';
import 'custom_card.dart';

void _openModalAdd(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AddModal();
    },
  );
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

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
              top: 30,
              left: 30,
              right: 30,
              bottom: 10,
            ),
            color: const Color(0xFFF3B578),
            child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                      bottom: 30,
                    ),
                    color: const Color(0xFFF78376),
                    child: Column(children: <Widget>[
                      CustomCard(),

                      FloatingActionButton(
                        backgroundColor: const Color(0xFF3F3557),
                        onPressed: () {
                          _openModalAdd(context);
                        },
                        child: const Text('+'),
                      )
                    ])))));
  }
}
