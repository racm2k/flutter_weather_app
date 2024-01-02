import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherService {
  static const String apiKey =
      '82d47dd3dcc341b5bf9223445231707'; // Replace with your actual API key

  final WeatherBloc _weatherBloc;

  WeatherService(this._weatherBloc);

  Future<void> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?q=$city&key=$apiKey'));

    if (response.statusCode == 200) {
      log('boas0');
      final data = json.decode(response.body);
      final location = data['location'];
      final current = data['current'];

      final weather = Weather(
        location: location['name'],
        temperature: current['temp_c'].toDouble(),
        description: current['condition']['text'],
      );

      _weatherBloc.add(WeatherUpdated(weather: weather));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
