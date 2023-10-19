import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}

class WeatherInitialState extends GetWeatherState {}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherfailedState extends GetWeatherState {}
