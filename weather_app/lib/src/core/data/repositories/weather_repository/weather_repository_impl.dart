import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/data/models/forecast_response_model.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/core/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather_app/src/core/services/api_key_service/api_key_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio _dio;
  final ApiKeyService _apiKeyService;

  const WeatherRepositoryImpl(
      {required Dio dio, required ApiKeyService apiKeyService})
      : _dio = dio,
        _apiKeyService = apiKeyService,
        super();

  @override
  Future<List<LocationModel>?> getUpdatedSearchResults(String text) async {
    final String apiKey = await _apiKeyService.getWeatherApiKey();
    if (apiKey.isNotEmpty) {
      var response = await _dio.request(
          'https://api.weatherapi.com/v1/search.json?key=$apiKey&q=$text',
          options: Options(method: 'GET'));

      if (response.statusCode == 200) {
        final List<LocationModel> results = response.data
            .map<LocationModel>((e) => LocationModel.fromJson(e))
            .toList();
        return results;
      }
    }
    return [];
  }

  Future<void> getWeather(String city) async {
    final String apiKey = await _apiKeyService.getWeatherApiKey();
    final response = await _dio.request(
        'https://api.weatherapi.com/v1/current.json?q=$city&key=$apiKey');

    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      final location = data['location'];
      final current = data['current'];
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<ForecastResponseModel?> getWeatherForecast(String location) async {
    final String apiKey = await _apiKeyService.getWeatherApiKey();
    if (apiKey.isNotEmpty) {
      final response = await _dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=5&aqi=no&alerts=no',
          options: Options(method: 'GET'));

      if (response.statusCode == 200) {
        return ForecastResponseModel.fromJson(response.data);
      }
    }
    return null;
  }
}
