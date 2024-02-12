import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/core/data/repositories/weather_repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio _dio;

  const WeatherRepositoryImpl({required Dio dio})
      : _dio = dio,
        super();

  @override
  Future<List<LocationModel>?> getUpdatedSearchResults(String text) async {
    var response = await _dio.request(
        'https://api.weatherapi.com/v1/search.json?key=82d47dd3dcc341b5bf9223445231707&q=$text',
        options: Options(method: 'GET'));

    if (response.statusCode == 200) {
      final List<LocationModel> results = response.data
          .map<LocationModel>((e) => LocationModel.fromJson(e))
          .toList();
      return results;
    } else {
      return [];
    }
  }

  Future<void> getWeather(String city) async {
    final response = await _dio.request(
        'https://api.weatherapi.com/v1/current.json?q=$city&key=82d47dd3dcc341b5bf9223445231707');

    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      final location = data['location'];
      final current = data['current'];
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<void> fetchLocationWeatherDetails(String location) async {
    final response = await _dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=82d47dd3dcc341b5bf9223445231707&q=porto portugal&days=5&aqi=no&alerts=no');

    if (response.statusCode == 200) {}
  }
}
