import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    //http://api.weatherapi.com/v1/current.json?key=f9fae6b323f64be2923122136230508&q=Warsaw&aqi=no
    final response = await Dio().get(
        'http://api.weatherapi.com/v1/current.json?key=f9fae6b323f64be2923122136230508&q=Warsaw&aqi=no');
    print(response.data);
    return const WeatherModel(city: 'Warsaw', temperature: -5.5);
  }
}
