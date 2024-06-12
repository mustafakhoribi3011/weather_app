import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_screen/ui/screens/weather_forecast_screen.dart';

import 'core/di/di.dart';
import 'core/sizing/size_config.dart';
import 'features/weather_screen/logic/cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context)=> getIt<TemperatureForecastCubit>(),
          child: const WeatherForecastScreen()),
    );
  }
}

