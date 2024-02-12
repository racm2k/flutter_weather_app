import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/core/data/models/current_weather_model.dart';
import 'package:weather_app/src/core/data/models/forecast_weather_model.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';

part 'forecast_response_model.g.dart';

@JsonSerializable()
class ForecastResponseModel {
  final LocationModel location;
  @JsonKey(name: 'current')
  final CurrentWeatherModel currentWeather;
  @JsonKey(name: 'forecast')
  final ForecastWeatherModel forecastWeather;

  const ForecastResponseModel({
    required this.currentWeather,
    required this.forecastWeather,
    required this.location,
  });

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseModelFromJson(json);

  /// Connect the generated [_$ForecastResponseModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastResponseModelToJson(this);
}
