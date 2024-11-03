import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/weather_detail_model.dart';
import 'package:weather_app/domain/models/position_model.dart';

// khai bao quan ly phuong thuc

abstract class WeatherApi {
  Future<WeatherData> getWeatherCurrentImp(PositionModel position);
  Future<List<WeatherDetail>> getWeatherDetailImp(PositionModel position);
}
