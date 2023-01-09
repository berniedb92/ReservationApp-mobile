import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/tessera.dart';
import '../../repository/prenotazioni_repository.dart';

part 'tesserati_event.dart';
part 'tesserati_state.dart';

class TesseratiBloc extends Bloc<TesseratiEvent, TesseratiState> {
  final PrenotazioniRepository _prenotazioniRepository;

  TesseratiBloc({required PrenotazioniRepository prenotazioniRepository})
      : _prenotazioniRepository = prenotazioniRepository,
        super(TesseratiState()) {
    on<TesseratiChanged>(_caricaTessere);
    on<TesseratiChangedCodice>(_caricaTessereCodice);
  }

  void _caricaTessere(
      TesseratiChanged event, Emitter<TesseratiState> emit) async {

    final tessere = await _prenotazioniRepository.caricaTessere();

    emit(state.copyWith(tesserati: tessere));
  }

  void _caricaTessereCodice(
      TesseratiChangedCodice event, Emitter<TesseratiState> emit) async {

    final tessera = await _prenotazioniRepository.caricaTessereCodice(event.codice!);

    emit(state.copyWith(tessera: tessera));
  }
}
