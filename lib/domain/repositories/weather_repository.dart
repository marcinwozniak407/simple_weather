import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=f9fae6b323f64be2923122136230508&q=$city&aqi=no');
    final responseData = response.data;

    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;
    return WeatherModel(city: name, temperature: temperature);
  }
}
