import 'dart:async';

import 'package:bloc_denemesi/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_denemesi/models/todo_model.dart';

class TodoBloc {
  List<Todo> todoList = [];

  final _todoEventStreamController = StreamController<TodoEvent>();
  StreamSink<TodoEvent> get todoEventSink => _todoEventStreamController.sink;
  Stream<TodoEvent> get _todoEventStream => _todoEventStreamController.stream;

  final _todoStateStreamController = StreamController<List<Todo>>();
  StreamSink<List<Todo>> get _todoStateSink => _todoStateStreamController.sink;
  Stream<List<Todo>> get todo => _todoStateStreamController.stream;

  TodoBloc() {
    _todoEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(TodoEvent event) {
    if (event is TodoEkle) {
      todoList.add(Todo(baslik: event.baslik, icerik: event.icerik));
    } else {}

    _todoStateSink.add(todoList);
  }
}
