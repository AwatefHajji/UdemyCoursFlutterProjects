import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  //late GetWeatherCubit getweathercubit;

  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getweather({required String city}) async {
    try {
      weatherModel = await WeatherService(Dio()).getweather(city: city);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherfailedState());
    }
  }
}
