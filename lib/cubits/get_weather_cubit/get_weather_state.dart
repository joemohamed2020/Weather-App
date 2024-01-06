import 'package:weather_app/models/weather_model.dart';

class WeatherState{}
class NoWeatherState extends WeatherState{}
class WeatherSuccessState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}
class WeatherFailedState extends WeatherState{
  final String msg;

  WeatherFailedState( {required this.msg});
}