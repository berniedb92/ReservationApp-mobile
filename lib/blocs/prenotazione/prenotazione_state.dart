part of 'prenotazione_bloc.dart';

class PrenotazioneState extends Equatable {
  List<Prenotazione>? prenotazioni;
  List<Campo>? campi;
  String? select;
  String? modInizio;
  String? modFine;
  String? message;
  Campo? campo;
  Tessera? tessera1;
  Tessera? tessera2;

  PrenotazioneState({this.prenotazioni, this.campi, this.select, this.modInizio, this.modFine, this.message, this.campo, this.tessera1, this.tessera2});

  PrenotazioneState copyWith(
      {List<Prenotazione>? prenotazioni,
      List<Campo>? campi,
      String? select,
      String? modInizio,
        String? modFine,
        String? message,
        Campo? campo,
        Tessera? tessera1,
        Tessera? tessera2
      }) {
    return PrenotazioneState(
        prenotazioni: prenotazioni ?? this.prenotazioni,
        campi: campi ?? this.campi,
        select: select ?? this.select,
        modInizio: modInizio ?? this.modInizio,
        modFine: modFine ?? this.modFine,
        message: message ?? this.message,
        campo: campo ?? this.campo,
        tessera1: tessera1 ?? this.tessera1,
        tessera2: tessera2 ?? this.tessera2
    );
  }

  @override
  List<Object?> get props => [
        {prenotazioni, campi, select, modInizio, modFine, message, campo, tessera1, tessera2}
      ];
}
