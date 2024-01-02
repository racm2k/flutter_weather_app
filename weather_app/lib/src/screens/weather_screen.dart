import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/services/weather_service.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoaded) {
              final currentWeather = state.weather;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Location: ${currentWeather.location}'),
                  Text('Temperature: ${currentWeather.temperature} °C'),
                  Text('Description: ${currentWeather.description}'),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(context);
        },
        tooltip: 'Update Weather',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter City'),
          content: TextField(
            controller: _cityController,
            decoration: const InputDecoration(hintText: 'City'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _updateWeather(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _updateWeather(BuildContext context) {
    final String city = _cityController.text.trim();
    if (city.isNotEmpty) {
      final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
      final WeatherService weatherService = WeatherService(weatherBloc);
      weatherService.getWeather(city);
    }
  }
}
