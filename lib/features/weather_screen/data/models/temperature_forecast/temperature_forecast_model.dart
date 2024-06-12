import 'package:freezed_annotation/freezed_annotation.dart';

import '../condition_data/condition_data_model.dart';
import '../current_data/current_data_model.dart';
import '../location_data/location_data_model.dart';
part 'temperature_forecast_model.g.dart';

@JsonSerializable()
class TemperatureForecastModel {
  @JsonKey(name: 'location')
  LocationDataModel? location;
  @JsonKey(name: 'current')
  CurrentDataModel? current;


  TemperatureForecastModel({
    this.location,
    this.current,

  });

  factory TemperatureForecastModel.fromJson(Map<String, dynamic> json) => _$TemperatureForecastModelFromJson(json);
}
