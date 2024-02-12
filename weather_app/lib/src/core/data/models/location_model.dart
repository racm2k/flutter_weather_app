import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String name;
  final String region;
  final String country;

  const LocationModel({
    required this.country,
    required this.name,
    required this.region,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// Connect the generated [_$LocationModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
