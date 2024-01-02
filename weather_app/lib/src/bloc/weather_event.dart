part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherUpdated extends WeatherEvent {
  final Weather weather;

  WeatherUpdated({required this.weather});
}
