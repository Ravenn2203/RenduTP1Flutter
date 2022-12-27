import 'package:flutter/material.dart';
import 'package:tp1/TP1/resultat_arguments.dart';

class ResultatsPage extends StatefulWidget {
  const ResultatsPage({Key? key}) : super(key: key);

  @override
  State<ResultatsPage> createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  @override
  Widget build(BuildContext context) {
    //On extrait les arguments passés via la route
    final args =
        ModalRoute.of(context)!.settings.arguments as ResultatArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz!'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.white,
      body: Card(
        margin: EdgeInsets.fromLTRB(10,250,10,0),
        elevation: 0,
        color: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              'Vous avez répondu correctement à ' +
                  args.nbBonnesReponses.toString() +
                  ' questions sur ' +
                  args.nbQuestions.toString() +
                  '! Ce qui vous fait un score de : '+args.nbBonnesReponses.toString()+'/'+args.nbQuestions.toString(),
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 19.0,
              )),
        ),
      ),
    );
  }
}
