import 'package:dio/dio.dart';
import 'package:weather_app/features/weather_screen/data/models/temperature_forecast/temperature_forecast_model.dart';
import '../../../../core/networking/api_result/api_result.dart';
import '../../../../core/networking/api_service/api_service.dart';

class TempForecastRepo{
  final ApiService _apiService;

  TempForecastRepo(this._apiService,);

  Future<ApiResult<TemperatureForecastModel>> getCurrentWeather(String key,String city) async{
    try{
      final response = await _apiService.getCurrentWeather(key,city);
      return ApiResult.success(response);
    }on DioException catch(error){
      return ApiResult.failure(error.response?.data['error']['message']);
    }
  }
}