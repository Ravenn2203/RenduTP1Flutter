import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Accueil'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  'TP1 de Léa Garcia',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                SizedBox(
                  height: 210,
                ),
                TextButton(
                    child: Text('Afficher mon profil'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[600],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profil');
                    }),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    child: Text('Accéder au quizz'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[600],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quizz');
                    })
              ],
            )));
  }
}
