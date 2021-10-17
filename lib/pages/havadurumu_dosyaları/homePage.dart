import 'dart:async';

import 'package:bloc_denemesi/controllers/sehiradi_controller.dart';
import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:bloc_denemesi/models/weather_model.dart';
import 'package:bloc_denemesi/pages/havadurumu_dosyalar%C4%B1/sehirSecPage.dart';
import 'package:bloc_denemesi/widgets/havaDurumuResimWidget.dart';
import 'package:bloc_denemesi/widgets/havaDurumuSicaklikWidget.dart';
import 'package:bloc_denemesi/widgets/sehirWidget.dart';
import 'package:bloc_denemesi/widgets/sonGuncellemeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HavaDurumuHome extends StatefulWidget {
  const HavaDurumuHome({Key? key}) : super(key: key);

  @override
  _HavaDurumuHomeState createState() => _HavaDurumuHomeState();
}

class _HavaDurumuHomeState extends State<HavaDurumuHome> {
  final SehirController _controller = Get.put(SehirController());
  String sehirAdi = 'Ankara';
  Completer<void> refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu Demo'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () async {
                sehirAdi = await Get.to(SehirSecPage());
                if (sehirAdi != 'null') {
                  _weatherBloc.add(FetchWeatherEvent(sehirAdi: sehirAdi));
                }
              },
              icon: Icon(CupertinoIcons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (context, state) {
            if (state is WeatherLoadedState) {
              final Weather? gelenWeather = state.weather;
              refreshCompleter.complete();
              refreshCompleter = Completer();
              return RefreshIndicator(
                onRefresh: () {
                  _weatherBloc.add(RefreshWeatherEvent(sehirAdi: sehirAdi));
                  return refreshCompleter.future;
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SehirAdi(
                        sehir: gelenWeather!.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SonGuncellemeWidget(
                        created: gelenWeather.time.toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HavaDurumuResimWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HavaDurumuSicaklik(
                        maxTemp: gelenWeather.consolidatedWeather![0]!.maxTemp,
                        minTemp: gelenWeather.consolidatedWeather![0]!.minTemp,
                      ),
                    )
                  ],
                ),
              );
            } else if (state is WeatherInitialState) {
              return Center(
                child: Text('Şehir Seçiniz'),
              );
            } else if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherErrorState) {
              return Center(
                child: Text('Hata Oluştu'),
              );
            } else {
              return Text("Hiçbir if'e girmedi");
            }
          },
        ),
      ),
    );
  }
}
