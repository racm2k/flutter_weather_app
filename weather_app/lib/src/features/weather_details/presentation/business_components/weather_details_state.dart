part of 'weather_details_cubit.dart';

class WeatherDetailsInitialState extends ApplicationState {
  const WeatherDetailsInitialState();
}

class WeatherDetailsLoadingState extends ApplicationState {
  const WeatherDetailsLoadingState();
}

class WeatherDetailsSuccessState extends ApplicationState {
  final ForecastResponseModel? forecast;
  const WeatherDetailsSuccessState({required this.forecast});
}
