part of 'tesserati_bloc.dart';

abstract class TesseratiEvent extends Equatable {
  const TesseratiEvent();

  @override
  List<Object> get props => [];
}

class TesseratiChanged extends TesseratiEvent {

  @override
  List<Object> get props => [];
}

class TesseratiChangedCodice extends TesseratiEvent {

  int? codice;

  TesseratiChangedCodice(this.codice);

  @override
  List<Object> get props => [];
}