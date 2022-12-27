import 'package:flutter/material.dart';
import 'package:tp1/TP1/resultats_page.dart';
import 'profil_page.dart';
import 'quizz_page.dart';
import 'home_page.dart';

void main() => runApp(MyTp1App());

class MyTp1App extends StatelessWidget {
  const MyTp1App({Key? key}) : super(key: key);

  //Cette fonction build retourne un widget, un arbre de widget si besoin
  @override
  Widget build(BuildContext context) {
    //Application utilisant du material design
    return MaterialApp(
      title: 'Ma première application en Flutter !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      //Le widget de la page d'accueil
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profil': (context) => ProfilPage(),
        '/quizz': (context) => QuizzPage(),
        '/resultats': (context) => ResultatsPage(),
      },
    );
  }
}
