import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/data/repositories/api_key_repository/api_key_repository.dart';

class ApiKeyRepositoryImpl implements ApiKeyRepository {
  final Dio _dio;

  const ApiKeyRepositoryImpl({required Dio dio})
      : _dio = dio,
        super();
  @override
  Future<String> getWeatherApiKey() async {
    try {
      var response = await _dio.request("http://10.0.2.2:8080/api-key",
          options: Options(method: 'GET'));

      if (response.statusCode == 200) {
        final String apiKey = response.data['data'];
        return apiKey;
      } else {
        throw Exception('error fetching weatherAPI apikey');
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
