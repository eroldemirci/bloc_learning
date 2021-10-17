part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState([List props = const []]);

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

// ignore: must_be_immutable
class WeatherLoadedState extends WeatherState {
  Weather? weather;
  WeatherLoadedState({@required this.weather});
}

class WeatherErrorState extends WeatherState {}
