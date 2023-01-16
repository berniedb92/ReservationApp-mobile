import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation/model/campo.dart';
import 'package:reservation/model/info_msg.dart';
import 'package:reservation/model/prenotazione.dart';
import 'package:reservation/repository/prenotazioni_repository.dart';

import '../../model/tessera.dart';

part 'prenotazione_event.dart';
part 'prenotazione_state.dart';

class PrenotazioneBloc extends Bloc<PrenotazioneEvent, PrenotazioneState> {
  final PrenotazioniRepository _prenotazioniRepository;

  PrenotazioneBloc({required PrenotazioniRepository prenotazioniRepository})
      : _prenotazioniRepository = prenotazioniRepository,
        super(PrenotazioneState(
            select: 'Singolo', modInizio: '8:00', modFine: '9:00')) {
    on<PrenotazioneChange>(_caricaPrenotazioni);
    on<PrenotazioneDropdownChange>(_caricaDrop);
    on<PrenotazioneAddChange>(_addPrenotazione);
  }

  void _caricaPrenotazioni(
      PrenotazioneChange event, Emitter<PrenotazioneState> emit) async {
    List<Prenotazione>? prenotazioni;

    prenotazioni = await _prenotazioniRepository.caricaPrenotazioni(
        event.date!, event.campo!);

    print('bloccc prenotazioni' + event.date!);

    emit(state.copyWith(prenotazioni: prenotazioni));
  }

  void _caricaDrop(
      PrenotazioneDropdownChange event, Emitter<PrenotazioneState> emit) async {
    print(event.change);
    String? sel;
    String? modI;
    String? modF;

    sel = event.change!;
    modI = event.modInizio!;
    modF = event.modFine!;

    print('bloccccc sel ${sel}');
    print('bloccccc sel ${modI}');
    print('bloccccc sel ${modF}');

    emit(state.copyWith(modInizio: modI, modFine: modF, select: sel));
  }

  void _addPrenotazione(
      PrenotazioneAddChange event, Emitter<PrenotazioneState> emit) async {
    InfoMsg? message;
    Tessera tessera1;
    Tessera tessera2;
    Tessera tessera3;
    Tessera tessera4;
    Campo? campo;

    var date = DateTime.parse(event.data);
    var inizio = DateTime.parse('1970-01-01T${state.modInizio}:00.000+00:00');
    var fine = DateTime.parse('1970-01-01T${state.modFine}:00.000+00:00');
    int g1 = int.tryParse(event.codice1) ?? 0;
    int g2 = int.tryParse(event.codice2) ?? 0;
    int? g3 = int.tryParse(event.codice3 ?? '-1');
    int? g4 = int.tryParse(event.codice4 ?? '-1');

    tessera1 = await _prenotazioniRepository.caricaTessereCodice(g1);
    tessera2 = await _prenotazioniRepository.caricaTessereCodice(g2);
    tessera3 = await _prenotazioniRepository.caricaTessereCodice(g3 ?? -1);
    tessera4 = await _prenotazioniRepository.caricaTessereCodice(g4 ?? -1);

    var campoInt = int.tryParse(event.campo) ?? 0;
    campo = await _prenotazioniRepository.caricaCampoId(campoInt);

    Prenotazione prenotazione = Prenotazione(Random().nextInt(9999), date,
        inizio, fine, event.mod, campo, tessera1, tessera2, tessera3, tessera4);

    message = await _prenotazioniRepository.aggiungiPrenotazione(prenotazione);

    print('bloccccc message ${message.message}');

    emit(state.copyWith(message: message.message));
  }
}
