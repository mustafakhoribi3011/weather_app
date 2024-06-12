// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDataModel _$LocationDataModelFromJson(Map<String, dynamic> json) =>
    LocationDataModel(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationDataModelToJson(LocationDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
