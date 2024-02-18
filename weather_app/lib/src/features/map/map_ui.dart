import 'package:flutter/material.dart';
import 'package:weather_app/src/features/map/map_widget.dart';

class MapUI extends StatelessWidget {
  const MapUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OpenWeatherMapWidget(),
    );
  }
}
