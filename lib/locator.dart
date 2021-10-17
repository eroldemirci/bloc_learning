import 'package:bloc_denemesi/repository/weather_repository.dart';
import 'package:bloc_denemesi/services/weather_api_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
