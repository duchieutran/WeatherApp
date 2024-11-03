// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/domain/models/main_model.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/models/wind_model.dart';

class WeatherData {
  int? id;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  String? name;
  int? cod;
  WeatherData({
    this.id,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.name,
    this.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weather': weather!.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main!.toMap(),
      'visibility': visibility,
      'wind': wind!.toMap(),
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      name: map['name'] as String,
      cod: map['cod'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}

// model trong data thuong là dạng model sau khi call api, còn model trong domain thường là dạng model con
