import 'package:weather_app/src/core/data/models/weather_condition_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastDayModel {
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

  const ForecastDayModel({
    required this.condition,
    required this.maxTempInC,
    required this.maxTempInF,
    required this.minTempInC,
    required this.minTempInF,
    required this.uv,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  /// Connect the generated [_$ForecastDayModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
