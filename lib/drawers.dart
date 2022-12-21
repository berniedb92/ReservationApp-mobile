import 'package:flutter/material.dart';
import 'package:reservation/tesseramainscreen.dart';

import 'main.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: 
            ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain)
                      ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Prenotazioni', style: TextStyle(fontSize: 20),),
                ),
            ),
               ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReservationApp()));
              },
            ),
            ListTile(
              title: Text('Campo Tennis 1'),
              leading: Icon(Icons.sports_tennis),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => NumeriPrimi()));
              // },
            ),
            ListTile(
              title: Text('Campo Tennis 2'),
              leading: Icon(Icons.sports_tennis),
              // onTap: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => Numeri()));
              // },
            ),
            ListTile(
              title: Text('Campo Padel'),
              leading: Icon(Icons.sports_cricket),
              // onTap: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => Numeri()));
              // },
            ),
            ListTile(
              title: Text('Tesserati'),
              leading: Icon(Icons.card_membership),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TesseraScreen()));
              },
            ),
          ],
        )
        );
  }
}