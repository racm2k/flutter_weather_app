import 'package:weather_app/src/core/data/repositories/api_key_repository/api_key_repository.dart';

class ApiKeyService {
  final ApiKeyRepository _apiKeyRepository;
  const ApiKeyService({required ApiKeyRepository apiKeyRepository})
      : _apiKeyRepository = apiKeyRepository,
        super();

  Future<String> getWeatherApiKey() async =>
      await _apiKeyRepository.getWeatherApiKey();
}
