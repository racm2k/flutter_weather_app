import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/core/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather_app/src/features/home/domain/use_cases/home_use_case.dart';

class HomeUseCaseImpl implements HomeUseCase {
  final WeatherRepository _weatherRepository;

  const HomeUseCaseImpl({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super();
  @override
  Future<List<LocationModel>?> updateSearchResults(String value) async =>
      await _weatherRepository.getUpdatedSearchResults(value);
}
