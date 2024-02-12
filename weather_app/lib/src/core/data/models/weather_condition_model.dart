import 'package:json_annotation/json_annotation.dart';

part 'weather_condition_model.g.dart';

@JsonSerializable()
class ConditionModel {
  final String text;
  final String icon;
  final int code;

  const ConditionModel({
    required this.code,
    required this.icon,
    required this.text,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  /// Connect the generated [_$ConditionModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
