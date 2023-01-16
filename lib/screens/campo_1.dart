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

class Campo1 extends StatelessWidget {
  Campo1({Key? key}) : super(key: key);

  List<Prenotazione> prenotazioni = [];
  bool load = false;

  TextEditingController dateController = TextEditingController();

  TextEditingController numero1Controller = TextEditingController();
  TextEditingController numero2Controller = TextEditingController();

  List<String> camp = [];

  // final List<String> timeSelect = [
  //   '8:00 - 9:00',
  //   '9:00 - 10:00',
  //   '10:00 - 11:00',
  //   '11:00 - 12:00',
  //   '12:00 - 13:00',
  //   '13:00 - 14:00',
  //   '14:00 - 15:00',
  //   '15:00 - 16:00',
  //   '16:00 - 17:00',
  //   '17:00 - 18:00',
  //   '18:00 - 19:00',
  //   '19:00 - 20:00',
  //   '20:00 - 21:00',
  //   '21:00 - 22:00',
  //   '22:00 - 23:00'
  // ];

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
        title: Text('Prenotazioni campo 1'),
      ),
      body: BlocBuilder<PrenotazioneBloc, PrenotazioneState>(
          builder: (context, state, [bool mounted = true]) {
            prenotazioni = [];

            print('${state.message}messageeee');
            state.prenotazioni == null || state.prenotazioni == []
                  ? prenotazioni = []
                  : prenotazioni = state.prenotazioni!;

              if(state.prenotazioni == null || state.prenotazioni == []){
                load = true;
                context.read<PrenotazioneBloc>().add(PrenotazioneChange(
                   DateTime.now().toString(), 1));
              }

            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
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
                            lastDate: DateTime(2100)

                        );

                        if (pickedDate != null) {
                          prenotazioni = [];
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate);
                          dateController.text = formattedDate;

                        }
                        if (!mounted) return;
                        context.read<PrenotazioneBloc>().add(PrenotazioneChange(
                            dateController.text.toString(), 1));

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
                              leading:
                               Image.asset('assets/images/tennis-balls.png',
                                   width: 70),
                              title:
                              Text(
                                ''
                                  '${formatTime(prenotazioni[posizione].oraInizio!)} - ${formatTime(prenotazioni[posizione].oraFine!)}'
                                   ),
                              subtitle:
                                  Text(
                                    ''
                                      '${prenotazioni[posizione].giocatore1!.clienteTess} - ${prenotazioni[posizione].giocatore2!.clienteTess}'
                                  ),
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
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => context.goNamed(
                "prenotazione",
                params: {"campo": '1'},
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  List<String> splitTime(List<String> l) {
    List<String> splittedTime = [];
      for(var i = 0; i<l.length; i++) {

        List<String> splitt = l[i].split('-');
        splittedTime.add(splitt[1].trimLeft());
      }
      print(splittedTime);

      return splittedTime;
  }
}
