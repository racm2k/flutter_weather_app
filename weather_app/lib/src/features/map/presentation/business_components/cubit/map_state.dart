part of 'map_cubit.dart';

abstract class MapState extends ApplicationState {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {
  const MapInitial();
}

class MapLocationServicesDisabled extends MapState {
  const MapLocationServicesDisabled();
}

class MapLocationServicesDenied extends MapState {
  const MapLocationServicesDenied();
}

class MapLocationServicesDeniedForever extends MapState {
  const MapLocationServicesDeniedForever();
}

class MapLocationGiven extends MapState {
  final Position position;
  const MapLocationGiven({required this.position});
}

class MapLocationServiceStatusUpdated extends MapState {
  final ServiceStatus status;
  const MapLocationServiceStatusUpdated({required this.status});
}
