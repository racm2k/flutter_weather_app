import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/core/data/models/forecast_day_model.dart';

part 'forecast_weather_model.g.dart';

@JsonSerializable()
class ForecastWeatherModel {
  final List<ForecastDayModel> forecastday;

  const ForecastWeatherModel({
    required this.forecastday,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherModelFromJson(json);

  /// Connect the generated [_$ForecastWeatherModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastWeatherModelToJson(this);
}
