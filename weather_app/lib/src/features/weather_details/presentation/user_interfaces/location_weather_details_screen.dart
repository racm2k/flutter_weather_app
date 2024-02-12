import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/core/cubit/cubit_factory.dart';
import 'package:weather_app/src/core/data/models/forecast_response_model.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/core/utils/decoders/date_decoder.dart';
import 'package:weather_app/src/features/weather_details/presentation/business_components/weather_details_cubit.dart';

class LocationWeatherDetailsScreen extends StatefulWidget {
  final LocationModel location;
  static const routeName = '/location-weather-details';
  const LocationWeatherDetailsScreen({required this.location, super.key});

  @override
  State<LocationWeatherDetailsScreen> createState() =>
      _LocationWeatherDetailsScreenState();
}

class _LocationWeatherDetailsScreenState
    extends State<LocationWeatherDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final WeatherDetailsCubit _weatherDetailsCubit =
      CubitFactory.weatherDetailsCubit;

  ForecastResponseModel? _forecast;

  @override
  void initState() {
    super.initState();
    _weatherDetailsCubit.getWeatherForecast(
        '${widget.location.name} ${widget.location.country}');
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.location.name}, ${widget.location.country}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Now',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 72,
              ),
              BlocConsumer<WeatherDetailsCubit, ApplicationState>(
                bloc: _weatherDetailsCubit,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case WeatherDetailsSuccessState:
                      _forecast =
                          (state as WeatherDetailsSuccessState).forecast;

                      return _buildSuccessState();
                    default:
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessState() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https:${_forecast!.currentWeather.condition.icon}',
            height: 100,
            fit: BoxFit.fitHeight,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            '${_forecast!.currentWeather.tempInC}º',
            style: const TextStyle(fontSize: 52, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            _forecast!.currentWeather.condition.text,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 64,
          ),
          const Text('Wind', style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_forecast!.currentWeather.windKPH} km/h',
                style: const TextStyle(fontSize: 14),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._forecast!.forecastWeather.forecastday.map((e) {
                  final parsedDate = DateTime.parse(e.date);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${DateDecoder.getWeekDay(parsedDate.weekday)}, ${DateDecoder.getMonth(parsedDate.month)} ${parsedDate.day}'),
                      Image.network(
                        'https:${e.day.condition.icon}',
                        height: 26,
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                          '${e.day.maxTempInC.toStringAsFixed(0)}º ${e.day.minTempInC.toStringAsFixed(0)}º')
                    ],
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
