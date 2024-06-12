import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/features/weather_screen/data/models/temperature_forecast/temperature_forecast_model.dart';
import '../api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('')
  Future<TemperatureForecastModel> getCurrentWeather(
      @Query("key") String apiKey,
      @Query("q") String query,
      );
}