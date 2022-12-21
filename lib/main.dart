import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reservation/cliente.dart';
import 'package:reservation/clientescreen.dart';
import 'package:reservation/drawers.dart';

void main() {
  runApp(const ReservationApp());
}

class ReservationApp extends StatelessWidget {
  const ReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Reservation(),
    );
  }
}

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  String risultato = '';
  List<Cliente> clienti = [];

  @override
  void initState() {
    caricaClienti();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation app'),
      ),
      drawer: const Drawers(),
      body: 
      ListView.builder(
          itemCount: clienti.length,
          itemBuilder: (BuildContext context, int posizione) {
            return Card(
              child: ListTile(
                onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                              builder: (_) => ClienteScreen(clienti[posizione]));
                          Navigator.push(context, route);
                        },
                leading: Image.asset(
                'assets/images/utente.png'),
                title: Text(clienti[posizione].cognome),
                subtitle: Text(clienti[posizione].nome),
              ),
            );
          }),
    );
  }

  Future caricaClienti() async {
    const dominio = '192.168.1.21:8080';
    const percorso = '/api/reservation/list-clienti';
    //Map<String, dynamic> parametri = {'/list-clienti'};
    final Uri url = Uri.http(dominio, percorso);

    http.get(url).then((value) {
      final resJson = json.decode(value.body);
      print(resJson);
      final clientiMap = resJson;
      clienti =
          clientiMap?.map<Cliente>((maps) => Cliente.fromMap(maps))?.toList() ??
              [];
      setState(() {
        risultato = value.body;
        print(risultato);
        clienti = clienti;
      });
    });
    setState(() {
      risultato = 'Richiesta in corso';
    });
  }
}
