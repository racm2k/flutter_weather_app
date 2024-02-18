import 'package:flutter/material.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/features/map/presentation/business_components/cubit/map_cubit.dart';

class LocationWarningWidget extends StatelessWidget {
  final ApplicationState state;
  final VoidCallback onRetryDeterminePosition;
  final VoidCallback onOpenAppSettings;
  const LocationWarningWidget(
      {super.key,
      required this.state,
      required this.onRetryDeterminePosition,
      required this.onOpenAppSettings});

  @override
  Widget build(BuildContext context) {
    switch (state.runtimeType) {
      case MapLocationServicesDenied:
        return Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text(
                'You have to enable location services to have the best experience.'),
            ElevatedButton(
                onPressed: onRetryDeterminePosition, child: const Text('Retry'))
          ]),
        );
      case MapLocationServicesDeniedForever:
        return Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text(
                'You have to enable location services to have the best experience.'),
            ElevatedButton(
                onPressed: onOpenAppSettings,
                child: const Text('Change location permissions in settings'))
          ]),
        );
      case MapLocationServicesDisabled:
        return const Center(
          child: Text('You have to enable GPS to have the best experience.'),
        );

      default:
        return const Placeholder();
    }
  }
}
