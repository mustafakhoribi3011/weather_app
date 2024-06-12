import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_data_model.g.dart';


@JsonSerializable()
class LocationDataModel{
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lon')
  double? lon;


  LocationDataModel({this.name,this.region,this.country,this.lat,this.lon,});

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);
}
