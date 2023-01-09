import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation/compinents/drawers.dart';
import 'package:http/http.dart' as http;
import 'package:reservation/screens/tessera_screen.dart';
import 'dart:convert';

import '../blocs/tesserati/tesserati_bloc.dart';
import '../model/tessera.dart';

class TesseraMain extends StatelessWidget {
  TesseraMain({super.key});

  List<Tessera> tesserati = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawers(),
        appBar: AppBar(title: const Text('Tesserati')),
        body: BlocBuilder<TesseratiBloc, TesseratiState>(
          builder: (context, state) {
            if(tesserati.isEmpty) {
              context.read<TesseratiBloc>().add(TesseratiChanged());
              state.tesserati == null || state.tesserati == []
                  ? tesserati = []
                  : tesserati = state.tesserati!;
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
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
                          'Action',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    for (var t in tesserati)
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(t.codiceTessera.toString())),
                          DataCell(
                            Text(t.clienteTess),
                          ),
                          DataCell(ElevatedButton(
                              onPressed: () => context.goNamed(
                                "infotessera",
                                params: {"codice": t.codiceTessera.toString()},
                              ),
                              child: const Text('Info',
                                  style: TextStyle(color: Colors.white))),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ));
  }

}
