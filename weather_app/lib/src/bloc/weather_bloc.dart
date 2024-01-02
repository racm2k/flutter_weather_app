import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherUpdated>(
        ((event, emit) => emit(WeatherLoaded(weather: event.weather))));
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) {
    return WeatherLoaded(
      weather: Weather(
        location: json['location'],
        temperature: json['temperature'],
        description: json['description'],
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return {
        'location': state.weather.location,
        'temperature': state.weather.temperature,
        'description': state.weather.description,
      };
    }
    return {};
  }
}
