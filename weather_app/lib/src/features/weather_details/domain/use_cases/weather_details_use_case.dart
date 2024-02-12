import 'package:weather_app/src/core/data/models/forecast_response_model.dart';

abstract class WeatherDetailsUseCase {
  Future<ForecastResponseModel?> getWeatherForecast(String location);
}
