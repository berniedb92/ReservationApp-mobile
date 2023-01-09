import 'dart:convert';

import 'package:reservation/model/tessera.dart';

import 'campo.dart';

class Prenotazione {
  Tessera tesseraInit = Tessera(-1, "", "", "", "", "", "", false, 0, "", false);
  Campo campoInit = Campo(-1, '', '');

  late int? id;
  late DateTime? data;
  late DateTime? oraInizio;
  late DateTime? oraFine;
  late String? modalita;
  late int? codicePrenotazione;
  late Campo campo;
  late Tessera giocatore1;
  late Tessera giocatore2;
  late Tessera? giocatore3;
  late Tessera? giocatore4;
  late String? evento;

  Prenotazione(
      this.id,
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
    id = mappa['id'];
    data = DateTime.parse(mappa['data']);
    oraInizio = DateTime.parse(mappa['oraInizio']);
    oraFine = DateTime.parse(mappa['oraFine']);
    modalita = mappa['modalita'];
    codicePrenotazione = mappa['codicePrenotazione'];
    campo = Campo.fromMap(mappa['campo'] ?? campoInit);
    giocatore1 = Tessera.fromMap(mappa['giocatore1'] ?? tesseraInit);
    giocatore2 = Tessera.fromMap(mappa['giocatore2'] ?? tesseraInit);
    // giocatore3 = Tessera.fromMap(mappa['giocatore3'] ?? tesseraInit);
    // giocatore4 = Tessera.fromMap(mappa['giocatore4'] ?? tesseraInit);
    evento = mappa['evento'];
  }
}
