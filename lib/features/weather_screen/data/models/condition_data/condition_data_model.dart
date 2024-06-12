import 'package:freezed_annotation/freezed_annotation.dart';
part 'condition_data_model.g.dart';


@JsonSerializable()
class ConditionDataModel{
  @JsonKey(name: 'text')
  String? text;


  ConditionDataModel({this.text,});

  factory ConditionDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionDataModelFromJson(json);
}
