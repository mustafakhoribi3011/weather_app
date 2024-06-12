import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/networking/api_constants.dart';
import 'package:weather_app/features/weather_screen/logic/cubit.dart';
import 'package:weather_app/features/weather_screen/logic/states.dart';

import '../../../../core/sizing/size_config.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TemperatureForecastCubit>();
    return Scaffold(
      body:SafeArea(
        child: BlocSelector<TemperatureForecastCubit, TemperatureForecastStates, bool>(
          selector: (state) => state.getTemperatureForecast.loading,
          builder:(context, value) => BlocListener<TemperatureForecastCubit,TemperatureForecastStates>(
            listenWhen: (previous, current) => previous.getTemperatureForecast.fail != current.getTemperatureForecast.fail,
            listener: (context, state) {
              if(value == true){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.getTemperatureForecast.error.toString())));
              }
            },
            child:value == false? Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:SizeConfig.width(20),vertical:SizeConfig.height(20)),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter city name';
                        }
                        return null;
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical:18,horizontal:20),
                        focusedBorder:OutlineInputBorder(
                          borderSide:const BorderSide(
                            color:Colors.blue,
                            width:1.3,
                          ),
                          borderRadius:BorderRadius.circular(16),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide:const BorderSide(
                            color:Color(0xffA8A8A8),
                            width:1.3,
                          ),
                          borderRadius:BorderRadius.circular(16),
                        ),
                        errorBorder:OutlineInputBorder(
                          borderSide:const BorderSide(
                            color:Colors.red,
                            width:1.3,
                          ),
                          borderRadius:BorderRadius.circular(16),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                          borderSide:const BorderSide(
                            color:Colors.blue,
                            width:1.3,
                          ),
                          borderRadius:BorderRadius.circular(16),
                        ),
                        hintText:'Enter the City',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:SizeConfig.height(15)),
                      child: ElevatedButton(onPressed: (){
                        if (formKey.currentState!.validate()){
                          cubit.emitTempForecastStates(ApiConstants.apiKey,controller.text);
                        }
                      },child:const Text('Get Weather Forecast'),),
                    ),
                    ListTile(
                      leading:const Icon(Icons.location_on_outlined),
                      title: const Text('City Name'),
                      subtitle: Text(cubit.temperatureForecastModel?.location?.name ?? ''),
                    ),
                    ListTile(
                      leading:const Icon(Icons.thermostat),
                      title: const Text('Temp in celsius'),
                      subtitle: Text(cubit.temperatureForecastModel?.current?.tempC.toString() ?? ''),
                    ),
                    ListTile(
                      leading:const Icon(Icons.thermostat),
                      title: const Text('Temp in Fahrenheit'),
                      subtitle: Text(cubit.temperatureForecastModel?.current?.tempF.toString() ?? ''),
                    ),
                    ListTile(
                      leading:const Icon(Icons.water_drop_outlined),
                      title: const Text('Humidity'),
                      subtitle: Text(cubit.temperatureForecastModel?.current?.humidity.toString() ?? ''),
                    ),
                    ListTile(
                      leading:(() {
                        switch (cubit.temperatureForecastModel?.current?.condition?.text) {
                          case 'Sunny':
                            return Image.asset('assets/icons/sunny.png', height: SizeConfig.height(22));
                          case 'Partly cloudy':
                            return Image.asset('assets/icons/cloudy.png', height: SizeConfig.height(22));
                          case 'Patchy rain nearby':
                            return Image.asset('assets/icons/rainy.png', height: SizeConfig.height(22));
                          default:
                            return Image.asset('assets/icons/weather.png', height: SizeConfig.height(22));
                        }
                      })(),
                      title: const Text('Weather Description'),
                      subtitle: Text(cubit.temperatureForecastModel?.current?.condition?.text ?? ''),
                    ),

                  ],
                ),
              ),
            ):const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
