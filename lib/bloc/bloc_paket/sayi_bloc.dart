import 'package:bloc_denemesi/bloc/bloc_paket/bloc_paket_event.dart';
import 'package:bloc_denemesi/bloc/bloc_paket/bloc_paket_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class SayiBloc extends Bloc<SayiEvent, SayiState> {
  SayiBloc(SayiState initialState) : super(initialState);

  void onIncrement() {
    add(SayiArttirEvent());
  }

  void onDecrement() {
    add(SayiAzaltEvent());
  }

  @override
  // ignore: override_on_non_overriding_member
  SayiState get initialState => SayiState.init();

  @override
  Stream<SayiState> mapEventToState(SayiEvent event) async* {
    if (event is SayiArttirEvent) {
      yield SayiState(sayi: state.sayi! + 1);
    } else if (event is SayiAzaltEvent) {
      yield SayiState(sayi: state.sayi! - 1);
    }
  }
}
