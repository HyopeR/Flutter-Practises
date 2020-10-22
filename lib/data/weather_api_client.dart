import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient = http.Client();

  Future<int> getLocationId(String cityName) async {

    final String cityUrl = '$baseUrl/api/location/search/?query=$cityName';
    final response = await httpClient.get(cityUrl);

    if(response.statusCode != 200){
      throw Exception('Şehir verisi getirilemedi!');
    }

    final json = (jsonDecode(response.body)) as List;
    return json[0]['woeid'];
  }


  Future<Weather> getWeather(int cityId) async {

    final String weatherUrl = '$baseUrl/api/location/$cityId';
    final response = await httpClient.get(weatherUrl);

    if(response.statusCode != 200){
      throw Exception('Şehir hava durumu verisi getirilemedi!');
    }

    final json = jsonDecode(response.body);
    return Weather.fromJson(json);

  }
}