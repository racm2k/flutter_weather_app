import 'package:dio/dio.dart';
import 'package:weather_app/src/core/data/repositories/api_key_repository/api_key_repository_impl.dart';
import 'package:weather_app/src/core/data/repositories/weather_repository/weather_repository_impl.dart';
import 'package:weather_app/src/core/services/api_key_service/api_key_service.dart';
import 'package:weather_app/src/features/home/domain/use_cases/home_use_case_impl.dart';
import 'package:weather_app/src/features/home/presentation/business_components/home_cubit.dart';
import 'package:weather_app/src/features/map/presentation/business_components/cubit/map_cubit.dart';
import 'package:weather_app/src/features/weather_details/domain/use_cases/weather_details_use_case_impl.dart';
import 'package:weather_app/src/features/weather_details/presentation/business_components/weather_details_cubit.dart';

class CubitFactory {
  static final Dio _dio = Dio();
  static final ApiKeyService _apiKeyService =
      ApiKeyService(apiKeyRepository: ApiKeyRepositoryImpl(dio: _dio));
  static WeatherDetailsCubit get weatherDetailsCubit => WeatherDetailsCubit(
      weatherDetailsUseCase: WeatherDetailsUseCaseImpl(
          weatherRepository:
              WeatherRepositoryImpl(dio: _dio, apiKeyService: _apiKeyService)));
  static HomeCubit get homeCubit => HomeCubit(
      homeUseCase: HomeUseCaseImpl(
          weatherRepository:
              WeatherRepositoryImpl(dio: _dio, apiKeyService: _apiKeyService)));
  static MapCubit get mapCubit => MapCubit();
}
