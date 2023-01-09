import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'campo_event.dart';
part 'campo_state.dart';

class CampoBloc extends Bloc<CampoEvent, CampoState> {
  CampoBloc() : super(CampoInitial()) {
    on<CampoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
