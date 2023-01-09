part of 'prenotazione_bloc.dart';

abstract class PrenotazioneEvent extends Equatable {
  const PrenotazioneEvent();

  @override
  List<Object> get props => [];
}
class PrenotazioneChange extends PrenotazioneEvent {

  String? date;
  int? campo;

  PrenotazioneChange(this.date, this.campo);

  @override
  List<Object> get props => [];
}

class PrenotazioneDropdownChange extends PrenotazioneEvent {

  String? change;

  PrenotazioneDropdownChange(this.change);

  @override
  List<Object> get props => [];
}

class PrenotazioneModalitaInizioChange extends PrenotazioneEvent {

  String? mod;

  PrenotazioneModalitaInizioChange(this.mod);

  @override
  List<Object> get props => [];
}

class PrenotazioneModalitaFineChange extends PrenotazioneEvent {

  String? mod;

  PrenotazioneModalitaFineChange(this.mod);

  @override
  List<Object> get props => [];
}

class PrenotazioneAddChange extends PrenotazioneEvent {

  Prenotazione? pren;

  PrenotazioneAddChange(this.pren);

  @override
  List<Object> get props => [];
}

class PrenotazioneCampo extends PrenotazioneEvent {

  int? numero;

  PrenotazioneCampo(this.numero);

  @override
  List<Object> get props => [];
}

class PrenotazioneTessera1 extends PrenotazioneEvent {

  int? codice1;

  PrenotazioneTessera1(this.codice1);

  @override
  List<Object> get props => [];
}

class PrenotazioneTessera2 extends PrenotazioneEvent {

  int? codice2;

  PrenotazioneTessera2(this.codice2);

  @override
  List<Object> get props => [];
}