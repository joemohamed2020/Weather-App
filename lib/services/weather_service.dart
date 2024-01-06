import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseURL = "http://api.weatherapi.com/v1/forecast.json?key=";
  final String apiKey = "6279d8200396416a88c80550230110";
  Dio dio;
  WeatherService({required this.dio});
  Future<WeatherModel> getWeather({required String query}) async {
    try {
      Response response = await dio.get("$baseURL${apiKey}&q=$query");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMsg =
          e.response?.data ?? "oops some thing went wrong,Try again later";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Try again later");
    }
  }
}
