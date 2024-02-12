// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponseModel _$ForecastResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForecastResponseModel(
      currentWeather:
          CurrentWeatherModel.fromJson(json['current'] as Map<String, dynamic>),
      forecastWeather: ForecastWeatherModel.fromJson(
          json['forecast'] as Map<String, dynamic>),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseModelToJson(
        ForecastResponseModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.currentWeather,
      'forecast': instance.forecastWeather,
    };
