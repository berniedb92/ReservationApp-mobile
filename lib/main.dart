import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reservation/cliente.dart';
import 'package:reservation/clientescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReservationApp(),
    );
  }
}

class ReservationApp extends StatefulWidget {
  const ReservationApp({super.key});

  @override
  State<ReservationApp> createState() => _ReservationAppState();
}

class _ReservationAppState extends State<ReservationApp> {
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
                leading: const FlutterLogo(),
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
      print(value);
      final resJson = json.decode(value.body);
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
