import 'dart:async';

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
  String? sel;
  String? modInizio;
  String? modFine;

  PrenotazioneBloc({required PrenotazioniRepository prenotazioniRepository})
      : _prenotazioniRepository = prenotazioniRepository,
        super(PrenotazioneState()) {
    on<PrenotazioneChange>(_caricaPrenotazioni);
    on<PrenotazioneDropdownChange>(_caricaDrop);
    on<PrenotazioneModalitaInizioChange>(_caricaModInizio);
    on<PrenotazioneModalitaFineChange>(_caricaModFine);
    on<PrenotazioneAddChange>(_addPrenotazione);
    on<PrenotazioneCampo>(_caricaCampo);
    on<PrenotazioneTessera1>(_caricaTessera1);
    on<PrenotazioneTessera2>(_caricaTessera2);
  }

  void _caricaPrenotazioni(
      PrenotazioneChange event, Emitter<PrenotazioneState> emit) async {
    final prenotazioni = await _prenotazioniRepository.caricaPrenotazioni(
        event.date!, event.campo!);

    final campi = await _prenotazioniRepository.caricaCampo();

    print('bloccc' + event.date!);

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: campi));
  }

  void _caricaDrop(
      PrenotazioneDropdownChange event, Emitter<PrenotazioneState> emit) async {
    print(event.change);

    this.sel = event.change!;

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: sel,
        campi: state.campi));
  }

  void _caricaModInizio(PrenotazioneModalitaInizioChange event,
      Emitter<PrenotazioneState> emit) async {
    print(event.mod);

    this.modInizio = event.mod!;

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: state.campi));
  }

  void _caricaModFine(PrenotazioneModalitaFineChange event,
      Emitter<PrenotazioneState> emit) async {
    print(event.mod);

    this.modFine = event.mod!;

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: modFine,
        select: state.select,
        campi: state.campi));
  }

  void _addPrenotazione(
      PrenotazioneAddChange event, Emitter<PrenotazioneState> emit) async {
    InfoMsg? message;

    message = await _prenotazioniRepository.aggiungiPrenotazione(event.pren!);

    emit(state.copyWith(
        message: message.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: state.campi));
  }

  void _caricaCampo(
      PrenotazioneCampo event, Emitter<PrenotazioneState> emit) async {
    Campo? campo;

    campo = await _prenotazioniRepository.caricaCampoId(event.numero!);

    print('bloccccccccccc ${campo.numero}');

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: state.tessera2,
        campo: campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: state.campi));
  }

  void _caricaTessera1(
      PrenotazioneTessera1 event, Emitter<PrenotazioneState> emit) async {
    Tessera? tessera1;

    tessera1 = await _prenotazioniRepository.caricaTessereCodice(event.codice1!);

    print('bloccccccccccc ${tessera1.codiceTessera}');

    emit(state.copyWith(
        message: state.message,
        tessera1: tessera1,
        tessera2: state.tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: state.campi));
  }

  void _caricaTessera2(
      PrenotazioneTessera2 event, Emitter<PrenotazioneState> emit) async {
    Tessera? tessera2;

    tessera2 = await _prenotazioniRepository.caricaTessereCodice(event.codice2!);

    print('bloccccccccccc ${tessera2.codiceTessera}');

    emit(state.copyWith(
        message: state.message,
        tessera1: state.tessera1,
        tessera2: tessera2,
        campo: state.campo,
        prenotazioni: state.prenotazioni,
        modInizio: state.modInizio,
        modFine: state.modFine,
        select: state.select,
        campi: state.campi));
  }
}
