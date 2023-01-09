import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation/model/cliente.dart';

import '../../repository/prenotazioni_repository.dart';

part 'clienti_event.dart';
part 'clienti_state.dart';

class ClientiBloc extends Bloc<ClientiEvent, ClientiState> {
  final PrenotazioniRepository _preontazioniRepo;

  ClientiBloc({required PrenotazioniRepository preontazioniRepo})
      : _preontazioniRepo = preontazioniRepo,
        super(ClientiState()) {
    on<ClientiChanged>(_loadClienti);
    on<ClientiInfo>(_loadClientiId);
  }

  void _loadClienti (ClientiChanged event, Emitter<ClientiState> emit) async {

    final clienti = await _preontazioniRepo.caricaClienti();

    print('clienticlocccccc' + clienti.toString());

    emit(state.copyWith(clienti: clienti));

  }

  void _loadClientiId (ClientiInfo event, Emitter<ClientiState> emit) async {

    final cliente = await _preontazioniRepo.caricaClientiId(event.id!);

    print('clienteee' + cliente.toString());

    emit(state.copyWith(cliente: cliente));

  }

}
