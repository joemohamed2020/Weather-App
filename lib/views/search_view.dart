import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search a City")),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (value)async{
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
              suffixIcon: Icon(Icons.search,color: Colors.grey,), border: OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter City Name'
            ),
            ),
        ),
      ),
    );
  }
}