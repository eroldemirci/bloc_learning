import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({Key? key}) : super(key: key);

  final String resimBaseUrl =
      'https://www.metaweather.com/static/img/weather/png/';

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Image.network(
          resimBaseUrl +
              (state as WeatherLoadedState)
                  .weather!
                  .consolidatedWeather![0]!
                  .weatherStateAbbr
                  .toString() +
              ".png",
          height: 200,
        );
      },
    );
  }
}
