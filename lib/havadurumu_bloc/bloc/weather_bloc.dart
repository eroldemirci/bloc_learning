import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_denemesi/locator.dart';
import 'package:bloc_denemesi/models/weather_model.dart';
import 'package:bloc_denemesi/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState());

  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather gelenWeather =
            await weatherRepository.getWeather(event.sehirAdi!);
        yield WeatherLoadedState(weather: gelenWeather);
      } catch (e) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather gelenWeather =
            await weatherRepository.getWeather(event.sehirAdi!);
        yield WeatherLoadedState(weather: gelenWeather);
      } catch (e) {
        yield state;
      }
    }
  }
}
