import 'package:bloc_denemesi/locator.dart';
import 'package:bloc_denemesi/models/weather_model.dart';
import 'package:bloc_denemesi/services/weather_api_client.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    final int sehirId = await weatherApiClient.getLocationId(sehir);
    return await weatherApiClient.getWeather(sehirId);
  }
}
