import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/tessera_main_screen.dart';

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
               ListTile(tileColor: Colors.lime,
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
               context.go('/');
              },
            ), ListTile(
              title: Text('Clienti'),
              leading: Icon(Icons.account_circle_outlined),
              onTap: () {
               context.go('/clienti');
              },
            ),
            ListTile(
              title: Text('Campo Tennis 1'),
              leading: Icon(Icons.sports_tennis),
              onTap: () {
                context.go('/campo-1');
              },
            ),
            ListTile(
              title: Text('Campo Tennis 2'),
              leading: Icon(Icons.sports_tennis),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Numeri()));
              },
            ),
            ListTile(
              title: Text('Campo Padel'),
              leading: Icon(Icons.sports_cricket),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Numeri()));
              },
            ),
            ListTile(
              title: Text('Tesserati'),
              leading: Icon(Icons.card_membership),
              onTap: () {
                context.go('/tesserati');
              },
            ),
          ],
        )
        );
  }
}