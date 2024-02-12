// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      maxTempInC: (json['maxtemp_c'] as num).toDouble(),
      maxTempInF: (json['maxtemp_f'] as num).toDouble(),
      minTempInC: (json['mintemp_c'] as num).toDouble(),
      minTempInF: (json['mintemp_f'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempInC,
      'maxtemp_f': instance.maxTempInF,
      'mintemp_c': instance.minTempInC,
      'mintemp_f': instance.minTempInF,
      'condition': instance.condition,
      'uv': instance.uv,
    };
