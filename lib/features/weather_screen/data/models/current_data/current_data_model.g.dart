// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentDataModel _$CurrentDataModelFromJson(Map<String, dynamic> json) =>
    CurrentDataModel(
      tempC: (json['temp_c'] as num?)?.toDouble(),
      tempF: (json['temp_f'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionDataModel.fromJson(
              json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentDataModelToJson(CurrentDataModel instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'humidity': instance.humidity,
    };
