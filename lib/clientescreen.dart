import 'package:flutter/material.dart';
import 'package:reservation/cliente.dart';

class ClienteScreen extends StatelessWidget {
  final Cliente cliente;
  const ClienteScreen(this.cliente, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cliente.cognome + ' ' + cliente.nome),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.network(
                    'https://www.giurisprudenzapenale.com/wp-content/uploads/2013/12/utente.png',
                    width: 200),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Cognome: ${cliente.cognome}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Nome: ${cliente.nome}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Data di nascita: ${cliente.dataNascita}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Luogo di nascita: ${cliente.luogoNascita}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('CF: ${cliente.codiceFiscale}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Nazionalità: ${cliente.nazionalita}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Indirizzo ${cliente.indirizzo}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Email ${cliente.email}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Numero tel.: ${cliente.numTelefono}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
            ],
          ),
        )));
  }
}
