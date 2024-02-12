import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/core/data/models/forecast_response_model.dart';
import 'package:weather_app/src/features/weather_details/domain/use_cases/weather_details_use_case.dart';

part 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<ApplicationState> {
  final WeatherDetailsUseCase _weatherDetailsUseCase;
  WeatherDetailsCubit({required WeatherDetailsUseCase weatherDetailsUseCase})
      : _weatherDetailsUseCase = weatherDetailsUseCase,
        super(const WeatherDetailsInitialState());

  void getWeatherForecast(String location) async {
    try {
      emit(const WeatherDetailsLoadingState());
      final data = await _weatherDetailsUseCase.getWeatherForecast(location);
      emit(WeatherDetailsSuccessState(forecast: data));
    } catch (e) {
      log(e.toString());
    }
  }
}
