import 'package:weather_app/src/core/data/models/forecast_response_model.dart';
import 'package:weather_app/src/core/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather_app/src/features/weather_details/domain/use_cases/weather_details_use_case.dart';

class WeatherDetailsUseCaseImpl implements WeatherDetailsUseCase {
  final WeatherRepository _weatherRepository;

  const WeatherDetailsUseCaseImpl(
      {required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super();

  @override
  Future<ForecastResponseModel?> getWeatherForecast(String location) async =>
      _weatherRepository.getWeatherForecast(location);
}
