import 'package:flutter/material.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    print(widget.location);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
                    "${widget.location.name}, ${widget.location.country}")),
          ],
        ),
      ),
    );
  }
}
