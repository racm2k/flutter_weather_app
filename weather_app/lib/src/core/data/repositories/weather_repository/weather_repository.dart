import 'package:weather_app/src/core/data/models/forecast_response_model.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';

abstract class WeatherRepository {
  Future<List<LocationModel>?> getUpdatedSearchResults(String value);

  Future<ForecastResponseModel?> getWeatherForecast(String location);
}
