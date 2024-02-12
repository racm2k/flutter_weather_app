import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/features/home/domain/use_cases/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<ApplicationState> {
  final HomeUseCase _homeUseCase;
  HomeCubit({required HomeUseCase homeUseCase})
      : _homeUseCase = homeUseCase,
        super(const HomeInitialState());

  void updateSearchResults(String value) async {
    try {
      emit(const HomeWeatherLocationSearchLoadingState());
      final List<LocationModel>? results =
          await _homeUseCase.updateSearchResults(value);

      emit(HomeWeatherLocationSearchSuccessState(results: results ?? []));
    } catch (e) {
      log('erro: $e');
    }
  }
}
