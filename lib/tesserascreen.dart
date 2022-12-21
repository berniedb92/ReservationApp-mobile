import 'package:flutter/material.dart';
import 'package:reservation/cliente.dart';
import 'package:reservation/tessera.dart';

class Tessera2Screen extends StatelessWidget {
  final Tessera tessera;
  Tessera2Screen(this.tessera, {super.key});

  List<String> tipo = [];
  List<String> integrazione = [];
  calc() {
    tipo = tessera.tipo.split('/');
    integrazione = tessera.integrazione.split('/');
  }
  Future init() async {
    calc();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        title: Text(tessera.clienteTess),
      ),
      body:
          // SingleChildScrollView(
          //   child:
          ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          Container(
            height: 150,
            child: Image.network(
                'https://www.giurisprudenzapenale.com/wp-content/uploads/2013/12/utente.png'),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Codice tessera: ${tessera.codiceTessera}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Cliente: ${tessera.clienteTess}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Data Tesseramento: ${tessera.dataTesseramento}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Tipo tessera: ',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('1 ${tipo[0]}',
                style: const TextStyle(fontSize: 20)),
          ),
          (tessera.tipo.length > 4)
              ? Container(
                  height: 50,
                  padding: const EdgeInsets.all(12),
                  color: Colors.teal[100],
                  child: Text('2 ${tipo[1]}',
                      style: const TextStyle(fontSize: 20)),
                )
              : Container(),
              Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Tesera aggiuntiva: ',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('1 ${integrazione[0]}',
                style: const TextStyle(fontSize: 20)),
          ),
          (tessera.integrazione.length > 4 && tessera.integrazione.contains('/'))
              ? Container(
                  height: 50,
                  padding: const EdgeInsets.all(12),
                  color: Colors.teal[100],
                  child: Text('2 ${integrazione[1]}',
                      style: const TextStyle(fontSize: 20)),
                )
              : Container(),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Scadenza certificato: ${tessera.scadenzaCertificato}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Scadenza tessera ${tessera.scadenzaTessera}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Quota tessera ${tessera.pagamento}€',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text(
                'Note: ${tessera.note == null ? 'Nessuna nota' : tessera.note}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Pagata: ${tessera.pagata == true ? 'Si' : 'No'}',
                style: const TextStyle(fontSize: 20)),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            color: Colors.teal[100],
            child: Text('Attiva: ${tessera.attiva == true ? 'Si' : 'No'}',
                style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
      // )
    );
  }
}
