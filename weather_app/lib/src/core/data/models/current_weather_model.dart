import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/core/data/models/weather_condition_model.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: 'temp_c')
  final double tempInC;
  @JsonKey(name: 'temp_f')
  final double tempInF;
  @JsonKey(name: 'is_day')
  final bool isDay;
  final ConditionModel condition;
  @JsonKey(name: 'wind_mph')
  final double windMPH;
  @JsonKey(name: 'wind_kph')
  final double windKPH;
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  final double uv;

  const CurrentWeatherModel({
    required this.condition,
    required this.isDay,
    required this.tempInC,
    required this.tempInF,
    required this.uv,
    required this.windDegree,
    required this.windDir,
    required this.windKPH,
    required this.windMPH,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  /// Connect the generated [_$CurrentWeatherModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}
