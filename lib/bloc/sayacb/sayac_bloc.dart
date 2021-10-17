import 'dart:async';

import 'package:bloc_denemesi/bloc/sayacb/sayac_event.dart';

class SayacBloc {
  int _sayac = 0;

  //event streamcontroller
  final _sayacEventStreamController = StreamController<SayacEvent>();
  StreamSink<SayacEvent> get sayacEventSink => _sayacEventStreamController.sink;
  Stream<SayacEvent> get _sayacEventStream =>
      _sayacEventStreamController.stream;

  //state streamcontroller
  final _sayacStateStreamController = StreamController<int>();
  StreamSink<int> get _sayacStateSink => _sayacStateStreamController.sink;
  Stream<int> get sayac => _sayacStateStreamController.stream;

  SayacBloc() {
    _sayacEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SayacEvent event) {
    if (event is ArttirEvent) {
      _sayac++;
    } else {
      _sayac--;
    }

    _sayacStateSink.add(_sayac);
  }
}
