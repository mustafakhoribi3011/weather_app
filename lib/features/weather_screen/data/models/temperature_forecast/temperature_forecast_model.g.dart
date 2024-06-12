// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureForecastModel _$TemperatureForecastModelFromJson(
        Map<String, dynamic> json) =>
    TemperatureForecastModel(
      location: json['location'] == null
          ? null
          : LocationDataModel.fromJson(
              json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentDataModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureForecastModelToJson(
        TemperatureForecastModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
