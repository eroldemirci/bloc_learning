part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  String? sehirAdi;
  FetchWeatherEvent({@required this.sehirAdi});
}

class RefreshWeatherEvent extends WeatherEvent {
  String? sehirAdi;
  RefreshWeatherEvent({@required this.sehirAdi});
}
