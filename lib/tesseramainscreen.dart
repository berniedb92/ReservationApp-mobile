import 'package:flutter/material.dart';
import 'package:reservation/drawers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'tessera.dart';
import 'tesserascreen.dart';

void main() => runApp(const TesseraScreen());

class TesseraScreen extends StatelessWidget {
  const TesseraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tesserati',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Tesseramento(),
    );
  }
}

class Tesseramento extends StatefulWidget {
  const Tesseramento({super.key});

  @override
  State<Tesseramento> createState() => _Tesseramento();
}

class _Tesseramento extends State<Tesseramento> {

  List<Tessera> tesserati = [];
  String risultato = '';

  @override
  void initState() {
    caricaTessere();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      drawer: const Drawers(),
      appBar: AppBar(title: const Text('Tesserati')),

    body:SingleChildScrollView(
      child: DataTable(
        dataRowHeight: 100,
        // border: TableBorder.all(
        //   color: Colors.black
        // ),
        columns: const <DataColumn>[
          DataColumn(
            label: Center(
              child: Text(
                'Codice',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Cognome',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Tipo',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          for (var t in tesserati) DataRow(
            cells: <DataCell>[
              DataCell(Text(t.codiceTessera.toString())),
              DataCell(Text(t.clienteTess), onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                              builder: (_) => Tessera2Screen(t));
                          Navigator.push(context, route);
                        },),
              DataCell(Text(t.tipo, style: const TextStyle(fontSize: 10),)),
            ],
          ),
        ],
      ),
    )
    );
  }

  Future caricaTessere() async {
    const dominio = '192.168.1.21:8080';
    const percorso = '/api/reservation/list-tesseramenti';
    //Map<String, dynamic> parametri = {'/list-clienti'};
    final Uri url = Uri.http(dominio, percorso);

    http.get(url).then((value) {
      //print(value);
      final resJson = json.decode(value.body);
       print(resJson);
      //final clientiMap = resJson[''];
      tesserati =
          resJson?.map<Tessera>((maps) => Tessera.fromMap(maps))?.toList() ??
              [];
      setState(() {
        risultato = value.body;
        print(risultato);
        tesserati = tesserati;
      });
    });
    setState(() {
      risultato = 'Richiesta in corso';
    });
  }
}


