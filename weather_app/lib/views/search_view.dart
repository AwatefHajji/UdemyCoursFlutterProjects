import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Search for city',
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (cityController) {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getweather(city: cityController);
              Navigator.pop(context);
            },
            controller: _cityController,
            decoration: const InputDecoration(
              fillColor: Colors.orangeAccent,
              border: OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter city name',
            ),
          ),
        ),
      ),
    );
  }
}
