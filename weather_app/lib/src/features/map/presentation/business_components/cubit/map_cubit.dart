import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapInitial());

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(const MapLocationServicesDisabled());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        emit(const MapLocationServicesDenied());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(const MapLocationServicesDeniedForever());
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    emit(MapLocationGiven(position: await Geolocator.getCurrentPosition()));
  }

  void updateLocationServiceStatus(ServiceStatus status) {
    if (status == ServiceStatus.disabled) {
      emit(const MapLocationServicesDisabled());
    } else {
      emit(MapLocationServiceStatusUpdated(status: status));
    }
  }
}
