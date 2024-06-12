import 'package:freezed_annotation/freezed_annotation.dart';

import '../condition_data/condition_data_model.dart';
part 'current_data_model.g.dart';

@JsonSerializable()
class CurrentDataModel {
  @JsonKey(name: 'temp_c')
  double? tempC;
  @JsonKey(name: 'temp_f')
  double? tempF;
  @JsonKey(name: 'condition')
  ConditionDataModel? condition;
  @JsonKey(name: 'wind_mph')
  double? windMph;
  @JsonKey(name: 'humidity')
  double? humidity;

  CurrentDataModel({
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.humidity,
  });

  factory CurrentDataModel.fromJson(Map<String, dynamic> json) => _$CurrentDataModelFromJson(json);
}
