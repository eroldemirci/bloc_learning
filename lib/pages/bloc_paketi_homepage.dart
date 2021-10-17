import 'package:bloc_denemesi/bloc/bloc_paket/bloc_paket_state.dart';
import 'package:bloc_denemesi/bloc/bloc_paket/sayi_bloc.dart';

import 'package:bloc_denemesi/bloc_paket/sayi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class AnasayfaBloc extends StatefulWidget {
  const AnasayfaBloc({Key? key}) : super(key: key);

  @override
  _AnasayfaBlocState createState() => _AnasayfaBlocState();
}

class _AnasayfaBlocState extends State<AnasayfaBloc> {
  final _mySayiBloc = SayiBloc(SayiState(sayi: 0));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayiBloc>(
      create: (context) => SayiBloc(SayiState(sayi: 0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc Paketi Anasayfası'),
        ),
        body: MyBodyWidget(),
        floatingActionButton: MyFloatingButtons(),
      ),
    );
  }
}

class MyFloatingButtons extends StatelessWidget {
  const MyFloatingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SayiBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            _bloc.onIncrement();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: '2',
          onPressed: () {
            _bloc.onDecrement();
          },
          tooltip: 'Increment',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class MyBodyWidget extends StatelessWidget {
  const MyBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SayiBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder(
              bloc: _bloc,
              builder: (context, SayiState sayiState) {
                return Text(sayiState.sayi.toString());
              }),
        ],
      ),
    );
  }
}
