part of 'home_cubit.dart';

class HomeInitialState extends ApplicationState {
  const HomeInitialState();
}

class HomeWeatherLocationSearchLoadingState extends ApplicationState {
  const HomeWeatherLocationSearchLoadingState();
}

class HomeWeatherLocationSearchSuccessState extends ApplicationState {
  final List<LocationModel> results;
  const HomeWeatherLocationSearchSuccessState({required this.results});
}
