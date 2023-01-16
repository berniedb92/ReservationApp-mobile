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
  String change;
  String modInizio;
  String modFine;

  PrenotazioneDropdownChange(this.change, this.modInizio, this.modFine);

  @override
  List<Object> get props => [change, modInizio, modFine];
}

class PrenotazioneAddChange extends PrenotazioneEvent {
  String codice1;
  String codice2;
  String? codice3;
  String? codice4;
  String data;
  String inizio;
  String fine;
  String mod;
  String campo;

  PrenotazioneAddChange(this.data, this.inizio, this.fine, this.mod, this.campo,
      this.codice1, this.codice2,
      [this.codice3, this.codice4]);

  @override
  List<Object> get props => [];
}

class PrenotazioneCampo extends PrenotazioneEvent {
  int? numero;

  PrenotazioneCampo(this.numero);

  @override
  List<Object> get props => [];
}

