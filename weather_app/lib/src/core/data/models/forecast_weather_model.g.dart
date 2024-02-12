// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherModel _$ForecastWeatherModelFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherModel(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastWeatherModelToJson(
        ForecastWeatherModel instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };
