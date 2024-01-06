import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class AfterSearchWidget extends StatelessWidget {
  AfterSearchWidget({super.key, required this.weather,required this.color});
  Color color;
   WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color,Colors.white]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(weatherModel.city,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          Text("Updated at ${weatherModel.dateTime.hour}:${weatherModel.dateTime.minute}",style: TextStyle(fontSize: 16),),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherModel.icon!= null?
              (weatherModel.icon!.contains("https:")? Image.network("${weatherModel.icon!}"):Image.network("https:${weatherModel.icon!}"))
                  :Image.asset("assets/cloudy.png"),
               Text(weatherModel.temp.toInt().toString(),style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
               Column(
                children: [
                  Text("MaxTemp: ${weatherModel.maxTemp.toInt().toString()}"),
                  Text("MinTemp: ${weatherModel.minTemp.toInt().toString()}")
                ],
              )
            ],
          ),
          const SizedBox(height: 50,),
           Text(weatherModel.condition,style: TextStyle(fontSize: 32),)
        ],
      ),
    );
  }
}
