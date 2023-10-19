import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String urlBase = 'http://api.weatherapi.com/v1';
  final String apiKey = '46d3a77740f942e7bbd95255231709';
  WeatherService(this.dio);

  Future<WeatherModel> getweather({required String city}) async {
    try {
      Response response = await dio.get(
          '$urlBase/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no');
      WeatherModel weatherResponse = WeatherModel.fromJson(response.data);
      return weatherResponse;
    } on DioException catch (e) {
      // a cause nullSafty data can be null so w must check if it is null and return a specify message if it is null
      final errMessage =
          e.response?.data['error']['message'] ?? 'oops there was a problem';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Try again later');
    }

    // Map<String, dynamic> jsonData = response.data;
    // // print(jsonData);
    // List<dynamic> weatherInfos = jsonData['forecast']['forecastday'];
    // //print(weatherInfos);
    // WeatherModel weather = WeatherModel(
    //     cityName: jsonData['location']['name'],
    //     maxTemperature: weatherInfos[0]['day']['maxtemp_c'],
    //     minTemperature: weatherInfos[0]['day']['mintemp_c'],
    //     avgTemperature: weatherInfos[0]['day']['avgtemp_c'],
    //     uptadetDate: weatherInfos[0]['date'],
    //     description: weatherInfos[0]['day']['condition']['text']);
    // print(weather.description);
    //return weather;
  }
}
