// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      isDay: json['is_day'] as bool,
      tempInC: (json['temp_c'] as num).toDouble(),
      tempInF: (json['temp_f'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'] as String,
      windKPH: (json['wind_kph'] as num).toDouble(),
      windMPH: (json['wind_mph'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'temp_c': instance.tempInC,
      'temp_f': instance.tempInF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMPH,
      'wind_kph': instance.windKPH,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'uv': instance.uv,
    };
