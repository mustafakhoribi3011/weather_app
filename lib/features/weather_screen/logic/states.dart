import 'package:weather_app/features/weather_screen/data/models/temperature_forecast/temperature_forecast_model.dart';

class TemperatureForecastStates {
  final GetTemperatureForecast getTemperatureForecast;
  const TemperatureForecastStates({
    this.getTemperatureForecast = const GetTemperatureForecast(),
  });
  TemperatureForecastStates copyWith(
      {GetTemperatureForecast? getTemperatureForecast,
      })=> TemperatureForecastStates(
      getTemperatureForecast:getTemperatureForecast ?? this.getTemperatureForecast
  );
}

class GetTemperatureForecast {
  final bool loading;
  final bool fail;
  final String? error;
  final TemperatureForecastModel? data;
  const GetTemperatureForecast({
    this.error,
    this.loading = false,
    this.fail = false,
    this.data,
  });
  GetTemperatureForecast get gettingData => const GetTemperatureForecast(
    loading: true,
  );
  GetTemperatureForecast success(TemperatureForecastModel data) => GetTemperatureForecast(
    data: data,
  );
  GetTemperatureForecast failed(String? error) => GetTemperatureForecast(
    fail: true,
    error: error,
  );
}