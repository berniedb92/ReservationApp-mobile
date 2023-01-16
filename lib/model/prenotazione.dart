import 'dart:convert';

import 'package:reservation/model/tessera.dart';

import 'campo.dart';

class Prenotazione {
  Map<String, dynamic> mappaNull = {
    'null': 'nessun valore'
  };

  late int? codicePrenotazione;
  late DateTime? data;
  late DateTime? oraInizio;
  late DateTime? oraFine;
  late String? modalita;
  late Campo campo;
  late Tessera giocatore1;
  late Tessera giocatore2;
  late Tessera? giocatore3;
  late Tessera? giocatore4;
  late String? evento;

  Prenotazione(
      this.codicePrenotazione,
      this.data,
      this.oraInizio,
      this.oraFine,
      this.modalita,
      this.campo,
      this.giocatore1,
      this.giocatore2,
      [this.giocatore3,
      this.giocatore4,
      this.evento]);

  Prenotazione.fromMap(Map<String, dynamic> mappa) {
    codicePrenotazione = mappa['codicePrenotazione'];
    data = DateTime.parse(mappa['data']);
    oraInizio = DateTime.parse(mappa['oraInizio']);
    oraFine = DateTime.parse(mappa['oraFine']);
    modalita = mappa['modalita'];
    campo = Campo.fromMap(mappa['campo']);
    giocatore1 = Tessera.fromMap(mappa['giocatore1'] ?? mappaNull);
    giocatore2 = Tessera.fromMap(mappa['giocatore2'] ?? mappaNull);
    giocatore3 = Tessera.fromMap(mappa['giocatore3'] ?? mappaNull);
    giocatore4 = Tessera.fromMap(mappa['giocatore4'] ?? mappaNull);
    evento = mappa['evento'];
  }
}
