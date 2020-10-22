import 'package:weather_forecast/data/weather_api_client.dart';
import 'package:weather_forecast/locator.dart';
import 'package:weather_forecast/models/weather.dart';

class WeatherRepository {

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String cityName) async {

    final int cityId = await weatherApiClient.getLocationId(cityName);
    return weatherApiClient.getWeather(cityId);

  }


}