class Todo {
  String? baslik;
  String? icerik;
  int? id;

  Todo({
    this.baslik,
    this.icerik,
  });
  Todo.copyWithId({this.baslik, this.icerik, this.id});

  Todo.fromJson(Map<String, dynamic> json) {
    baslik = json['baslik'];
    icerik = json['icerik'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baslik'] = this.baslik;
    data['icerik'] = this.icerik;
    data['id'] = this.id;
    return data;
  }
}
