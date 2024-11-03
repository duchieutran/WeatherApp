import 'dart:convert';

import 'package:weather_app/domain/models/main_model.dart';
import 'package:weather_app/domain/models/weather_model.dart';

class WeatherDetail {
  Main main;
  Weather weather;
  String dt_txt; // TODO : sua bien
  WeatherDetail({
    required this.main,
    required this.weather,
    required this.dt_txt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main.toMap(),
      'weather': weather.toMap(),
      'dt_txt': dt_txt,
    };
  }

  factory WeatherDetail.fromMap(Map<String, dynamic> map) {
    return WeatherDetail(
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDetail.fromJson(String source) =>
      WeatherDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
