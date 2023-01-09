part of 'clienti_bloc.dart';

class ClientiState extends Equatable {
  List<Cliente>? clienti;
  Cliente? cliente;

  ClientiState({this.clienti, this.cliente});

  ClientiState copyWith({List<Cliente>? clienti, Cliente? cliente}) {
    return ClientiState(
        clienti: clienti ?? this.clienti, cliente: cliente ?? this.cliente);
  }

  @override
  List<Object?> get props => [
        {clienti, cliente}
      ];
}
