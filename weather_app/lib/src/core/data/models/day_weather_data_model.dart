import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/core/data/models/weather_condition_model.dart';

part 'day_weather_data_model.g.dart';

@JsonSerializable()
class DayWeatherDataModel {
  @JsonKey(name: 'maxtemp_c')
  final double maxTempInC;
  @JsonKey(name: 'maxtemp_f')
  final double maxTempInF;
  @JsonKey(name: 'mintemp_c')
  final double minTempInC;
  @JsonKey(name: 'mintemp_f')
  final double minTempInF;
  final ConditionModel condition;
  final double uv;

  DayWeatherDataModel({
    required this.condition,
    required this.maxTempInC,
    required this.maxTempInF,
    required this.minTempInC,
    required this.minTempInF,
    required this.uv,
  });

  factory DayWeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$DayWeatherDataModelFromJson(json);

  /// Connect the generated [_$DayWeatherDataModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DayWeatherDataModelToJson(this);
}
