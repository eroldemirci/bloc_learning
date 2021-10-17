abstract class TodoEvent {}

class TodoEkle extends TodoEvent {
  String? baslik;
  String? icerik;
}

class TodoSil extends TodoEvent {}
