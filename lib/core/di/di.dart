import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_screen/data/repo/tempForecast_repo.dart';
import 'package:weather_app/features/weather_screen/logic/cubit.dart';
import '../networking/api_service/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login
  getIt.registerLazySingleton<TempForecastRepo>(() => TempForecastRepo(getIt()));
  getIt.registerFactory<TemperatureForecastCubit>(() => TemperatureForecastCubit(getIt()));


}
