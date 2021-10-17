import 'package:bloc_denemesi/controllers/sehiradi_controller.dart';
import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

class SehirAdi extends StatelessWidget {
  SehirAdi({Key? key, this.sehir}) : super(key: key);
  String? sehir;

  @override
  Widget build(BuildContext context) {
    return Text(sehir!);
  }
}
