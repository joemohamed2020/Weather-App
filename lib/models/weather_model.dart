import 'package:flutter/foundation.dart';

class WeatherModel{
  String city;
  String? icon;
  DateTime dateTime;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;
  WeatherModel({this.icon,required this.dateTime,required this.city,required this.condition,required this.maxTemp,required this.minTemp,required this.temp});
  factory WeatherModel.fromJson(json){
    return WeatherModel(
        city: json['location']['name'],
        condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: json['current']['temp_c'],
        dateTime: DateTime.parse( json['current']['last_updated']),
        icon: json['forecast']['forecastday'][0]['day']['condition']['icon']
    );
  }
}