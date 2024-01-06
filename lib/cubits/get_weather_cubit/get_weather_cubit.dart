import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try {
      weatherModel =await WeatherService(dio: Dio()).getWeather(query: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailedState(msg: e.toString()));
    }

  }

}