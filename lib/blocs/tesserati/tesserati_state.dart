part of 'tesserati_bloc.dart';

class TesseratiState extends Equatable {
  List<Tessera>? tesserati;
  Tessera? tessera;

  TesseratiState({this.tesserati, this.tessera});

  TesseratiState copyWith({List<Tessera>? tesserati, Tessera? tessera}) {
    return TesseratiState(
        tesserati: tesserati ?? this.tesserati,
        tessera: tessera ?? this.tessera);
  }

  @override
  List<Object?> get props => [
        {tesserati, tessera}
      ];
}
