import 'package:weather_app/src/core/data/models/day_weather_data_model.dart';
import 'package:weather_app/src/core/data/models/weather_condition_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastDayModel {
  final String date;
  final DayWeatherDataModel day;

  const ForecastDayModel({
    required this.date,
    required this.day,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  /// Connect the generated [_$ForecastDayModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
