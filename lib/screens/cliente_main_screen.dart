import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation/blocs/clienti/clienti_bloc.dart';
import 'package:reservation/blocs/clienti/clienti_bloc.dart';

import '../compinents/drawers.dart';
import '../model/cliente.dart';
import 'cliente_screen.dart';

class ClienteMain extends StatelessWidget {
  ClienteMain({Key? key}) : super(key: key);
  List<Cliente> clienti = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reservation app'),
      ),
      drawer: const Drawers(),
      body:
      BlocBuilder<ClientiBloc, ClientiState>(
        builder: (context, state) {
          if(clienti.isEmpty) {
            context.read<ClientiBloc>().add(ClientiChanged());
            state.clienti == null || state.clienti == []
                ? clienti = []
                : clienti = state.clienti!;
          }
          return ListView.builder(
              itemCount: clienti.length,
              itemBuilder: (BuildContext context, int posizione) {
                return Card(
                  child: ListTile(
                    onTap: () => context.goNamed(
                          "infocliente",
                        params: {"id": clienti[posizione].id.toString()},
                    ),
                    leading: Image.asset(
                        'assets/images/utente.png'),
                    title: Text(clienti[posizione].cognome),
                    subtitle: Text(clienti[posizione].nome),
                  ),
                );
              });
        },
      ),
    );
  }
}
