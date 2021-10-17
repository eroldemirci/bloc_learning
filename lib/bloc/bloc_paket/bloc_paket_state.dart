class SayiState {
  int? sayi;

  SayiState._();
  SayiState({this.sayi});

  factory SayiState.init() {
    return SayiState._()..sayi = 0;
  }
}
