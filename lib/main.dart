import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>GetWeatherCubit(),
      child:Builder(builder: (context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: getTheme(BlocProvider
                      .of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,)
              ),
              home: HomeView()
          );
        }
      )
      )
    );
  }
  MaterialColor getTheme(String? condition) {
    if(condition == null){
      return Colors.blue;
    }

    condition = condition.toLowerCase();
    if (condition == "sunny" || condition == "clear") {
      return Colors.orange;
    } else if (condition.contains("cloudy")||condition.contains("pellets")) {
      return Colors.grey;
    } else if (condition.contains("rain")||condition.contains("snow")) {
      return Colors.lightBlue;
    } else if (condition.contains("drizzle")||condition.contains("fog")||condition.contains("mist") || condition.contains("haze")) {
      return Colors.blueGrey;
    } else if (condition.contains("thunder")) {
      return Colors.deepPurple;
    } else if (condition.contains("sleet")) {
      return Colors.indigo;
    } else if (condition.contains("freezing")) {
      return Colors.cyan;
    } else if (condition.contains("blizzard") || condition.contains("snowstorm")) {
      return Colors.blue;
    } else {
      return Colors.blue;
    }
  }
}


