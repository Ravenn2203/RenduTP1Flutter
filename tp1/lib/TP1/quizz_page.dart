import 'package:flutter/material.dart';
import 'package:tp1/TP1/resultat_arguments.dart';
import 'question.dart';
import 'resultats_page.dart';
import 'question_repository.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  final String title = 'Quizz!';

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  //Je récupère une question dans le répertoire les contenant
  Question question = QuestionRepository().getQuestion();

  //Variable qui empêche de passer à la question suivante sans avoir répondu
  bool reponse = false;

  //Variables qui vont permettre grâce à un setState, de changer la couleur des boutons en fonction des réponses des utilisateurs
  Color couleurBouttonVrai = Colors.grey;
  Color couleurBouttonFaux = Colors.grey;

  //Variable qui va contenir le nombre de questions auxquelles l'utilisateur doit répondre
  int nbQuestionTotal = 7;
  //Variable compteur du nombre de questions posées
  int nbQuestions = 6;

  //Variable qui va contenir le nombre de bonnes réponses;
  int nbBonnesReponses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quizz!'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: Column(
            children: [
              _getImage(),
              SizedBox(
                height: 40,
              ),
              _getQuestionCard(),
              SizedBox(
                height: 150,
              ),
              _getAnswerButtons(),
            ],
          ),
        ));
  }

  Container _getImage() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.black),
      ),
      child: Image.asset(
        question.imagePath,
        height: 180,
        width: 450,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Card _getQuestionCard() {
    return Card(
      elevation: 0,
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(question.questionText,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 18.0,
            )),
      ),
    );
  }

  Row _getAnswerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            child: Text('Vrai'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: couleurBouttonVrai,
            ),
            onPressed: () {
              if (!reponse) {
                reponse = true;
                if (_checkAnswer(true, context)) {
                  setState(() {
                    couleurBouttonVrai = Colors.green;
                  });
                  const snackBar = SnackBar(
                    content: Text('Bien joué!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    couleurBouttonVrai = Colors.red;
                  });
                }
              }
            }),
        TextButton(
            child: Text('Faux'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: couleurBouttonFaux,
            ),
            onPressed: () {
              if (!reponse) {
                reponse = true;
                if (_checkAnswer(false, context)) {
                  setState(() {
                    couleurBouttonFaux = Colors.green;
                  });
                  const snackBar = SnackBar(
                    content: Text('Bien joué!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    couleurBouttonFaux = Colors.red;
                  });
                }
              }
            }),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[600],
          ),
          icon: Icon(
            Icons.arrow_forward_outlined,
          ),
          label: Text('Question suivante'),
          onPressed: () {
            if (nbQuestions == 0 && reponse) {
              setState(() {
                Navigator.pushNamed(
                  context,
                  '/resultats',
                  arguments: ResultatArguments(
                    nbQuestionTotal, nbBonnesReponses,
                  ),
                );
              });
            } else {
              if (reponse) {
                reponse = false;
                setState(() {
                  question = QuestionRepository().getNextQuestion(nbQuestions);
                  couleurBouttonVrai = Colors.grey;
                  couleurBouttonFaux = Colors.grey;
                });
                nbQuestions--;
              } else {
                const snackBar = SnackBar(
                  content:
                      Text('Veuillez répondre avant de changer de question !'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
        ),
      ],
    );
  }

  bool _checkAnswer(bool userChoice, BuildContext context) {
    if (question.isCorrect == userChoice) {
      nbBonnesReponses++;
    }
    return question.isCorrect == userChoice;
  }
}
