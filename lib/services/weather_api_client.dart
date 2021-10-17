import 'dart:convert';

import 'package:bloc_denemesi/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const String baseUrl = 'https://www.metaweather.com/api/location/';
  final http.Client httpClient = http.Client();

  Future<int> getLocationId(String sehir) async {
    final String sehirUrl = baseUrl + 'search/?query=' + sehir;
    final result = await httpClient.get(Uri.parse(sehirUrl));

    if (result.statusCode != 200) {
      throw Exception('Veri Getirilemedi = ' + result.statusCode.toString());
    } else {
      final response = jsonDecode(result.body);
      return response[0]['woeid'];
    }
  }

  Future<Weather> getWeather(int sehirId) async {
    final String sehirUrl = baseUrl + sehirId.toString();
    final result = await httpClient.get(Uri.parse(sehirUrl));

    if (result.statusCode != 200) {
      throw Exception('Veri Getirilemedi = ' + result.statusCode.toString());
    } else {
      final response = jsonDecode(result.body);
      return Weather.fromJson(response);
    }
  }
}
