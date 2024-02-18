import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/src/core/cubit/application_state.dart';
import 'package:weather_app/src/core/cubit/cubit_factory.dart';
import 'package:weather_app/src/features/map/presentation/business_components/cubit/map_cubit.dart';
import 'package:weather_app/src/features/map/presentation/components/location_warning_component.dart';

class OpenWeatherMapWidget extends StatefulWidget {
  const OpenWeatherMapWidget({super.key});

  @override
  State<OpenWeatherMapWidget> createState() => _OpenWeatherMapWidgetState();
}

class _OpenWeatherMapWidgetState extends State<OpenWeatherMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final _mapCubit = CubitFactory.mapCubit;
  Position? _currentPosition;
  ServiceStatus? _locationStatus;

  bool _showLocationWarningWidget = false;

  @override
  void initState() {
    _mapCubit.determinePosition();
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    )).listen((Position? position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
      _currentPosition = position;
    });

    StreamSubscription<ServiceStatus> serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      print(status);
      if (_locationStatus != status) {
        _mapCubit.updateLocationServiceStatus(status);
      }
    });
    super.initState();
  }

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, ApplicationState>(
      bloc: _mapCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MapLocationServiceStatusUpdated:
            _locationStatus = (state as MapLocationServiceStatusUpdated).status;
            _showLocationWarningWidget = false;
            break;
          case MapLocationGiven:
            _showLocationWarningWidget = false;
            _currentPosition = (state as MapLocationGiven).position;
            _goToCurrentPosition();
            break;
          case MapLocationServicesDisabled:
            _locationStatus = ServiceStatus.disabled;
            _showLocationWarningWidget = true;
            break;
          case MapLocationServicesDenied:
          case MapLocationServicesDeniedForever:
            _showLocationWarningWidget = true;
            break;
          default:
        }
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.40991164518867, -8.51200540284191),
                zoom: 15.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              mapType: MapType.normal,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Visibility(
                  visible: _showLocationWarningWidget,
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: LocationWarningWidget(
                      state: state,
                      onRetryDeterminePosition: () =>
                          _mapCubit.determinePosition(),
                      onOpenAppSettings: () async {
                        var retry = await Geolocator.openAppSettings();
                        if (retry) {
                          _mapCubit.determinePosition();
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
