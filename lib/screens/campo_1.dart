import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reservation/blocs/prenotazione/prenotazione_bloc.dart';
import 'package:reservation/compinents/drawers.dart';
import 'package:reservation/model/cliente.dart';

import '../model/campo.dart';
import '../model/prenotazione.dart';
import '../repository/prenotazioni_repository.dart';

class Campo1 extends StatefulWidget {
  Campo1({Key? key}) : super(key: key);

  @override
  State<Campo1> createState() => _Campo1State();
}

class _Campo1State extends State<Campo1> {
  List<Prenotazione> prenotazioni = [];

  TextEditingController dateController = TextEditingController();

  TextEditingController numero1Controller = TextEditingController();
  TextEditingController numero2Controller = TextEditingController();

  List<String> camp = [];

  String formatTime(DateTime time) {
    return DateFormat.Hm().format(time);
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawers(),
      appBar: AppBar(
        title: Text('Campo 1'),
      ),
      body: BlocBuilder<PrenotazioneBloc, PrenotazioneState>(
        builder: (context, state) {
          if (prenotazioni.isEmpty) {
            context
                .read<PrenotazioneBloc>()
                .add(PrenotazioneChange(DateTime.now().toString(), 1));
            state.prenotazioni == null || state.prenotazioni == []
                ? prenotazioni = []
                : prenotazioni = state.prenotazioni!;
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              // const Text(
              //   'Lista Prenotazioni',
              //   style: TextStyle(
              //     fontSize: 25,
              //   ),
              // ),
              Container(
                height: 15,
                padding: const EdgeInsets.all(50.0),
              ),
              TextField(
                  controller:
                      dateController, //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText:
                          "Clicca per inserire la data" //label text of field
                      ),
                  readOnly: true, // when true user cannot edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        prenotazioni = [];
                        dateController.text = formattedDate;
                        context.read<PrenotazioneBloc>().add(PrenotazioneChange(
                            dateController.text.toString(),
                            1)); //set output date to TextField value.
                      });
                      context.read<PrenotazioneBloc>().add(PrenotazioneChange(
                          dateController.text.toString(), 1));
                    } else {}
                  }),
              Container(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: prenotazioni.length,
                    itemBuilder: (BuildContext context, int posizione) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          // => context.goNamed(
                          //   "infocliente",
                          //   params: {"id": clienti[posizione].id.toString()},
                          // ),
                          leading: Image.asset('assets/images/tennis-balls.png',
                              width: 70),
                          title: Text(
                              formatTime(prenotazioni[posizione].oraInizio!) +
                                  ' - ' +
                                  formatTime(prenotazioni[posizione].oraFine!) +
                                  ' ' +
                                  prenotazioni[posizione].giocatore1!.codiceTessera.toString() +
                                  ' ' +
                                  prenotazioni[posizione].giocatore2!.codiceTessera.toString()),
                          subtitle:
                              Text(formatDate(prenotazioni[posizione].data!)),
                        ),
                      );
                    }),
              )
            ]),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          BlocProvider<PrenotazioneBloc>(
            create: (context) {
              return PrenotazioneBloc(
                  prenotazioniRepository:
                      RepositoryProvider.of<PrenotazioniRepository>(context));
            },
            child: FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () => context.goNamed(
                "prenotazione",
                params: {"campo": '1'},
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // void _showDialog() {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Inserisci Prenotazione"),
  //         content: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //
  //               DropdownButton<String>(
  //                 value: oraInizio,
  //                 items: timeSelect.map((String value) {
  //                   return DropdownMenuItem(value: value, child: Text(value));
  //                 }).toList(),
  //                   onChanged: (value) => context.read<PrenotazioneBloc>().add(
  //                       PrenotazioneDropdownChange(value))
  //               ),
  //
  //               DropdownButton<String>(
  //                 value: oraFine,
  //                 items: timeSelect.map((String value) {
  //                   return DropdownMenuItem(value: value, child: Text(value));
  //                 }).toList(),
  //                 onChanged: (value) => context.read<PrenotazioneBloc>().add(
  //                   PrenotazioneDropdownChange(value))
  //               ),
  //               Flexible(
  //                 child: TextField(
  //                   controller: numero1Controller,
  //                   keyboardType: TextInputType.number,
  //                   style: TextStyle(),
  //                   decoration: const InputDecoration(hintText: 'Numero 1'),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 20.0,
  //               ),
  //               Flexible(
  //                 child: TextField(
  //                   controller: numero2Controller,
  //                   keyboardType: TextInputType.number,
  //                   style: TextStyle(),
  //                   decoration: const InputDecoration(hintText: 'Numero 2'),
  //                 ),
  //               )
  //             ]),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           TextButton(
  //             child: new Text("Close"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
