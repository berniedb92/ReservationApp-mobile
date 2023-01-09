import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/repository/prenotazioni_repository.dart';

import 'main.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.preontazioniRepo}) : super(key: key);
  final PrenotazioniRepository preontazioniRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(value: preontazioniRepo, child: ReservationApp());
  }
}