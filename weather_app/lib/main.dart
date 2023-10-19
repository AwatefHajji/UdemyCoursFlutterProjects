import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'package:weather_app/views/home_view.dart';

void main() {
  //
  // getweather();
  runApp(const WeatherApp());
}

// final Dio dio = Dio();

// Future<dynamic> getweather() async {
//   Response response = await dio.get(
//       'http://api.weatherapi.com/v1/current.json?key=46d3a77740f942e7bbd95255231709&q=Tunis&aqi=yes');
//   print(response);
// }

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

                // brightness: Brightness.light
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.description)),
            home: const HomeView(
              city: '',
            ),
          );
        },
      ),
    );
  }
}

// class CustomMaterialApp extends StatefulWidget {
//   const CustomMaterialApp({
//     super.key,
//   });

//   @override
//   State<CustomMaterialApp> createState() => _CustomMaterialAppState();
// }

// class _CustomMaterialAppState extends State<CustomMaterialApp> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetWeatherCubit, GetWeatherState>(
//       builder: (context, state) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(

//               // brightness: Brightness.light
//               primarySwatch: getThemeColor(
//                   BlocProvider.of<GetWeatherCubit>(context)
//                       .weatherModel
//                       ?.description)),
//           home: const HomeView(
//             city: '',
//           ),
//         );
//       },
//     );
//   }
// }

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.lightBlue;
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.yellow;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.lightBlue;
    case 'heavy freezing drizzle':
      return Colors.lightBlue;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
      return Colors.lightBlue;
    case 'moderate rain':
      return Colors.lightBlue;
    case 'heavy rain at times':
      return Colors.blue;
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
      return Colors.lightBlue;
    case 'moderate snow':
      return Colors.lightBlue;
    case 'patchy heavy snow':
      return Colors.lightBlue;
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
      return Colors.lightBlue;
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'patchy light rain with thunder':
      return Colors.yellow;
    case 'moderate or heavy rain with thunder':
      return Colors.yellow;
    case 'patchy light snow with thunder':
      return Colors.yellow;
    case 'moderate or heavy snow with thunder':
      return Colors.yellow;
    default:
      return Colors.blueGrey; // Default color if condition not found
  }
}
