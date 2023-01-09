part of 'clienti_bloc.dart';

abstract class ClientiEvent extends Equatable {
  const ClientiEvent();

  @override
  List<Object> get props => [];
}

class ClientiChanged extends ClientiEvent {
  @override
  List<Object> get props => [];
}

class ClientiInfo extends ClientiEvent {
  int? id;

  ClientiInfo(this.id);

  @override
  List<Object> get props => [];
}