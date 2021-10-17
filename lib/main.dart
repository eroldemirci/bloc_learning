import 'package:bloc_denemesi/bloc/sayacb/sayac_bloc.dart';
import 'package:bloc_denemesi/bloc/sayacb/sayac_event.dart';
import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:bloc_denemesi/locator.dart';

import 'package:bloc_denemesi/pages/havadurumu_dosyalar%C4%B1/homePage.dart';
import 'package:bloc_denemesi/pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: HavaDurumuHome(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sayacbloc = SayacBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                initialData: 0,
                stream: sayacbloc.sayac,
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                }),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoPage(),
                    )),
                child: Text('Todoya Git')),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              sayacbloc.sayacEventSink.add(ArttirEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              sayacbloc.sayacEventSink.add(AzaltEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
