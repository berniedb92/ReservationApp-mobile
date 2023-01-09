import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/blocs/tesserati/tesserati_bloc.dart';
import 'package:reservation/model/cliente.dart';
import 'package:reservation/model/tessera.dart';

class TesseraScreen extends StatelessWidget {
  Tessera tessera = Tessera(-1, "", "", "", "", "", "", false, 0, "", false);
  final String codice;
  TesseraScreen({super.key, required this.codice});

  List<String> tipo = [];
  List<String> integrazione = [];

  calc() {
    tipo = tessera.tipo.split('/');
    integrazione = tessera.integrazione.split('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tessera.clienteTess),
      ),
      body:
          // SingleChildScrollView(
          //   child:
          BlocBuilder<TesseratiBloc, TesseratiState>(
        builder: (context, state) {
          print(codice);
          if (tessera.codiceTessera == -1) {
            int id = int.tryParse(codice) ?? 0;
            context.read<TesseratiBloc>().add(TesseratiChangedCodice(id));
            print(state.tessera);
            state.tessera == null || tessera == null
                ? tessera
                : tessera = state.tessera!;
            calc();
          }
          return ListView(
            padding: const EdgeInsets.all(12),
            children: <Widget>[
              Container(
                height: 150,
                child: Image.asset('assets/images/utente.png'),
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
                child: const Text('Tipo tessera: ',
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child:
                    Text('1 ${tipo[0]}', style: const TextStyle(fontSize: 20)),
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
                child: const Text('Tesera aggiuntiva: ',
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('1 ${integrazione[0]}',
                    style: const TextStyle(fontSize: 20)),
              ),
              (tessera.integrazione.length > 4 &&
                      tessera.integrazione.contains('/'))
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
                child: Text(
                    'Scadenza certificato: ${tessera.scadenzaCertificato}',
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
                child: Text('Note: ${tessera.note ?? 'Nessuna nota'}',
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
          );
        },
      ),
      // )
    );
  }
}
