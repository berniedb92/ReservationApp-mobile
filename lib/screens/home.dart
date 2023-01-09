import 'package:flutter/material.dart';

import '../compinents/drawers.dart';
import '../routers.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        drawer: const Drawers(),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Prenotazioni'),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text('Home page',
                    style: TextStyle(color: Colors.grey[800], fontSize: 26)),
                Image.asset('assets/images/logo.png', height: 500),
              ]));
        }));
  }
}