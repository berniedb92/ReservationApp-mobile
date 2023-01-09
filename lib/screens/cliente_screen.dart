import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/model/cliente.dart';

import '../blocs/clienti/clienti_bloc.dart';

class ClienteScreen extends StatelessWidget {
  Cliente cliente = Cliente(-1, "", "", "", "", "", "", "", "", "");
  final String idCliente;

  ClienteScreen({super.key, required this.idCliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dettaglio'),
      ),
      body: BlocBuilder<ClientiBloc, ClientiState>(
        builder: (context, state) {
          print(idCliente);
          if (cliente.id == -1) {
            int id = int.tryParse(idCliente) ?? 0;
            context.read<ClientiBloc>().add(ClientiInfo(id));
            print(state.cliente);
            state.cliente == null || cliente == null
                ? cliente
                : cliente = state.cliente!;
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
                child: Text('Cognome: ${cliente.cognome}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Nome: ${cliente.nome}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Data di nascita: ${cliente.dataNascita}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Luogo di nascita: ${cliente.luogoNascita}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('CF: ${cliente.codiceFiscale}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Nazionalità: ${cliente.nazionalita}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Indirizzo ${cliente.indirizzo}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Email ${cliente.email}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.teal[100],
                child: Text('Numero tel.: ${cliente.numTelefono}',
                    style: const TextStyle(fontSize: 20)),
              ),
            ],
          );
        },
      ),
    );
  }
}
