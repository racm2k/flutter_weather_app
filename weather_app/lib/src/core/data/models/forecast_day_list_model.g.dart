// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayListModel _$ForecastDayListModelFromJson(
        Map<String, dynamic> json) =>
    ForecastDayListModel(
      date: json['date'] as String,
      day: ForecastDayModel.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayListModelToJson(
        ForecastDayListModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
    };
