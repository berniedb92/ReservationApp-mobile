part of 'prenotazione_bloc.dart';

class PrenotazioneState extends Equatable {
  List<Prenotazione>? prenotazioni;
  String select;
  String modInizio;
  String modFine;
  String? message;
  Campo? campo;
  Tessera? tessera1;
  Tessera? tessera2;
  Tessera? tessera3;
  Tessera? tessera4;

  PrenotazioneState(
      {this.prenotazioni,
      required this.select,
      required this.modInizio,
      required this.modFine,
      this.message,
      this.campo,
      this.tessera1,
      this.tessera2,
      this.tessera3,
      this.tessera4});

  PrenotazioneState copyWith(
      {List<Prenotazione>? prenotazioni,
      String? select,
      String? modInizio,
      String? modFine,
      String? message,
      Campo? campo,
      Tessera? tessera1,
      Tessera? tessera2,
      Tessera? tessera3,
      Tessera? tessera4}) {
    return PrenotazioneState(
        prenotazioni: prenotazioni ?? this.prenotazioni,
        select: select ?? this.select,
        modInizio: modInizio ?? this.modInizio,
        modFine: modFine ?? this.modFine,
        message: message ?? this.message,
        campo: campo ?? this.campo,
        tessera1: tessera1 ?? this.tessera1,
        tessera2: tessera2 ?? this.tessera2,
        tessera3: tessera3 ?? this.tessera3,
        tessera4: tessera4 ?? this.tessera4);
  }

  @override
  List<Object?> get props => [
        {
          prenotazioni,
          select,
          modInizio,
          modFine,
          message,
          campo,
          tessera1,
          tessera2,
          tessera3,
          tessera4
        }
      ];
}
