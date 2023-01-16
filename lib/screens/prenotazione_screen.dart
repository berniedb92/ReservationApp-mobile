import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reservation/blocs/prenotazione/prenotazione_bloc.dart';
import 'package:reservation/model/cliente.dart';
import 'dart:math';

import '../blocs/clienti/clienti_bloc.dart';
import '../model/campo.dart';
import '../model/prenotazione.dart';
import '../model/tessera.dart';
import '../repository/prenotazioni_repository.dart';

class PrenotazioneScreen extends StatelessWidget {
  TextEditingController giocatore1Controller = TextEditingController();
  TextEditingController giocatore2Controller = TextEditingController();
  TextEditingController giocatore3Controller = TextEditingController();
  TextEditingController giocatore4Controller = TextEditingController();

  final List<String> modalita = ['Singolo', 'Doppio'];

  final List<String> timeSelect = [
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00'
  ];

  final List<String> timeSelect2 = [
    '8:30',
    '9:30',
    '10:30',
    '11:30',
    '12:30',
    '13:30',
    '14:30',
    '15:30',
    '16:30',
    '17:30',
    '18:30',
    '19:30',
    '20:30',
    '21:30',
    '22:30',
    '23:30'
  ];

  final List<String> timeSelectPadel = [
    '8:00',
    '9:30',
    '11:00',
    '12:30',
    '14:00',
    '15:30',
    '17:00',
    '18:30',
    '20:00',
    '21:30',
    '23:00'
  ];

  TextEditingController dateController = TextEditingController();

  String formatTime(DateTime time) {
    return DateFormat.Hm().format(time);
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  final String campo;

  PrenotazioneScreen({super.key, required this.campo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title()),
      ),
      body: BlocBuilder<PrenotazioneBloc, PrenotazioneState>(
        builder: (context, state) {
          print(campo);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 15,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          TextField(
                              controller:
                                  dateController, //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16

                                  dateController.text = formattedDate;
                                } else {}
                              }),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton<String>(
                                  value: state.select,
                                  items: modalita.map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    //mod = value!;
                                    context.read<PrenotazioneBloc>().add(
                                        PrenotazioneDropdownChange(value!,
                                            state.modInizio, state.modFine));
                                  }),
                              const Text(
                                'Inizio: ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              DropdownButton<String>(
                                  value: state.modInizio,
                                  items: selectOrario().map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    //oraInizio = value!;
                                    context.read<PrenotazioneBloc>().add(
                                        PrenotazioneDropdownChange(state.select,
                                            value!, state.modFine));
                                  }),
                              const Text(
                                'Fine: ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              DropdownButton<String>(
                                  value: state.modFine,
                                  items: selectOrario().map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    //oraFine = value!;
                                    context.read<PrenotazioneBloc>().add(
                                        PrenotazioneDropdownChange(state.select,
                                            state.modInizio, value!));
                                  }),
                            ],
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          Flexible(
                            child: TextField(
                              controller: giocatore1Controller,
                              keyboardType: TextInputType.text,
                              style: TextStyle(),
                              decoration: const InputDecoration(
                                  hintText: 'Giocatore 1'),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          Flexible(
                            child: TextField(
                              controller: giocatore2Controller,
                              keyboardType: TextInputType.text,
                              style: TextStyle(),
                              decoration: const InputDecoration(
                                  hintText: 'Giocatore 2'),
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          state.select == 'Doppio'
                              ? Flexible(
                                  child: TextField(
                                    controller: giocatore3Controller,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(),
                                    decoration: const InputDecoration(
                                        hintText: 'Giocatore 3'),
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                          state.select == 'Doppio'
                              ? Flexible(
                                  child: TextField(
                                    controller: giocatore4Controller,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(),
                                    decoration: const InputDecoration(
                                        hintText: 'Giocatore 4'),
                                  ),
                                )
                              : Container(),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(50.0),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<PrenotazioneBloc, PrenotazioneState>(
        builder: (context, state) {
          return FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              if (giocatore3Controller.text != '' &&
                  giocatore4Controller.text != '') {
                context.read<PrenotazioneBloc>().add(PrenotazioneAddChange(
                    dateController.text,
                    state.modInizio,
                    state.modFine,
                    state.select,
                    campo,
                    giocatore1Controller.text,
                    giocatore2Controller.text,
                    giocatore3Controller.text,
                    giocatore4Controller.text));
              } else {
                context.read<PrenotazioneBloc>().add(PrenotazioneAddChange(
                    dateController.text,
                    state.modInizio,
                    state.modFine,
                    state.select,
                    campo,
                    giocatore1Controller.text,
                    giocatore2Controller.text));
              }

              print(state.message);

              String message = state.message ?? '';
              SnackBar snackBar = SnackBar(content: Text(message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              if (campo == '1') {
                context.goNamed('campo1');
              } else if (campo == '2') {
              } else if (campo == '3') {}
            },
          );
        },
      ),
    );
  }

  List<String> selectOrario() {
    if (campo == '1') {
      return timeSelect;
    } else if (campo == '2') {
      return timeSelect2;
    } else if (campo == '3') {
      return timeSelectPadel;
    } else {
      return [];
    }
  }

  String title() {
    if (campo == '1') {
      return 'Nuova prenotazione campo 1';
    } else if (campo == '2') {
      return 'Nuova prenotazione campo 2';
    } else if (campo == '3') {
      return 'Nuova prenotazione campo padel';
    } else {
      return '';
    }
  }
}
