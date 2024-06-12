import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_screen/data/models/temperature_forecast/temperature_forecast_model.dart';
import 'package:weather_app/features/weather_screen/data/repo/tempForecast_repo.dart';
import 'package:weather_app/features/weather_screen/logic/states.dart';


class TemperatureForecastCubit extends Cubit<TemperatureForecastStates>{
  final TempForecastRepo _tempForecastRepo;
  TemperatureForecastModel? temperatureForecastModel;


  TemperatureForecastCubit(this._tempForecastRepo):super(const TemperatureForecastStates());

  void emitTempForecastStates(String key,String city) async{
    emit(state.copyWith(getTemperatureForecast:state.getTemperatureForecast.gettingData));
    final response = await _tempForecastRepo.getCurrentWeather(key, city);

    response.when(
      success: (tempForecastRes)async{
        temperatureForecastModel = tempForecastRes;
        emit(state.copyWith(getTemperatureForecast: state.getTemperatureForecast.success(tempForecastRes)));
      },
      failure:(error){
        emit(state.copyWith(getTemperatureForecast:state.getTemperatureForecast.failed(error)));
        print(error);
        },
    );
  }

}