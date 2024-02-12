// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      date: json['date'] as String,
      day: DayWeatherDataModel.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
    };
