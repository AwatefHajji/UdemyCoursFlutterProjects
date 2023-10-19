class WeatherModel {
  final String? image;
  final String cityName;
  final double maxTemperature;
  final double minTemperature;
  final double avgTemperature;
  final String uptadetDate;
  final String description;

  WeatherModel(
      {this.image,
      required this.cityName,
      required this.maxTemperature,
      required this.minTemperature,
      required this.avgTemperature,
      required this.uptadetDate,
      required this.description});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        avgTemperature: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        description: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        uptadetDate: json['current']['last_updated']);
  }
}
