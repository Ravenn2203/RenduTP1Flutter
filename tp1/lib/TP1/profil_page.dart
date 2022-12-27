import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Page de profil'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          Positioned(top: 120, child: _getCard()),
          Positioned(top: 20, left: 50, child: _getAvatar()),
        ]),
      ),
    );
  }

  Container _getCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 180, 30, 50),
        child: Column(
          //Je crée une colonne qui va contenir plusieurs widgets
          //Elle va les mettre les uns en dessous des autres
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NOM, PRÉNOM',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 5),
            Text('Garcia Léa',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                )),
            SizedBox(height: 30),
            Text('EMAIL',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 5),
            Text('lea.garcia06@etu.umontpellier.fr',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                )),
            SizedBox(height: 30),
            Text('NIVEAU EN FLUTTER',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 5),
            Text('Débutante',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                )),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.black),
                SizedBox(
                  width: 10,
                ),
                Text('+XXXXXXXXXX',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontSize: 15.0,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar _getAvatar() {
    return CircleAvatar(
      radius: 125.0,
      backgroundColor: Colors.grey[600],
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/raiponce.png'),
        radius: 120.0,
      ),
    );
  }
}
