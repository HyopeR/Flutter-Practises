import 'package:get_it/get_it.dart';
import 'package:weather_forecast/data/weather_api_client.dart';
import 'package:weather_forecast/data/weather_repository.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {

  /// Singleton uygulama boyunca o nesneden yalnızca 1 adet üretilip kullanılan değerlere denir.
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());

  /// Factory ise her istekte bulunulduğunda o nesneden yeniden yeniden üretilen durumlara denir.
  // locator.registerFactory(() => null);

}
