import 'package:bloc_denemesi/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_denemesi/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_denemesi/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final _todoBloc = TodoBloc();

  TextEditingController _baslik = TextEditingController();
  TextEditingController _icerik = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<List<Todo>>(
                  initialData: [Todo(baslik: "Baslık 1", icerik: "İçerik 2")],
                  stream: _todoBloc.todo,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(snapshot.data![index].baslik.toString()),
                            subtitle:
                                Text(snapshot.data![index].icerik.toString()),
                          );
                        });
                  }),
              TextFormField(
                controller: _baslik,
                decoration: InputDecoration(labelText: 'Başlık'),
              ),
              TextFormField(
                controller: _icerik,
                decoration: InputDecoration(labelText: 'İçerik'),
              ),
              ElevatedButton(
                  onPressed: () {
                    TodoEkle().baslik = _baslik.text;
                    TodoEkle().icerik = _icerik.text;
                    _todoBloc.todoEventSink.add(TodoEkle());
                  },
                  child: Text('Ekle')),
            ],
          ),
        ),
      ),
    );
  }
}
