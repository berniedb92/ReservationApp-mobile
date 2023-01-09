import 'package:flutter/material.dart';

import 'package:reservation/model/cliente.dart';
import 'package:reservation/compinents/drawers.dart';
import 'package:reservation/repository/prenotazioni_repository.dart';
import 'package:reservation/routers.dart';
import 'package:reservation/screens/cliente_screen.dart';

import 'app.dart';

void main() {
  runApp(App(preontazioniRepo: PrenotazioniRepository()));
}

class ReservationApp extends StatefulWidget {
  const ReservationApp({super.key});

  @override
  State<ReservationApp> createState() => _ReservationAppState();
}

class _ReservationAppState extends State<ReservationApp> {
  late final Routers route;

  @override
  void initState() {
    route = Routers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: route.router,
      title: 'main',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        canvasColor: Colors.lime
      ),
    );
  }
}


