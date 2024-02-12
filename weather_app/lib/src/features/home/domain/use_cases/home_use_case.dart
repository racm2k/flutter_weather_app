import 'package:weather_app/src/core/data/models/location_model.dart';

abstract class HomeUseCase {
  Future<List<LocationModel>?> updateSearchResults(String value);
}
