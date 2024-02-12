import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/core/data/models/forecast_day_model.dart';

part 'forecast_day_list_model.g.dart';

@JsonSerializable()
class ForecastDayListModel {
  final String date;
  final ForecastDayModel day;
  const ForecastDayListModel({
    required this.date,
    required this.day,
  });

  factory ForecastDayListModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayListModelFromJson(json);

  /// Connect the generated [_$ForecastDayListModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastDayListModelToJson(this);
}
