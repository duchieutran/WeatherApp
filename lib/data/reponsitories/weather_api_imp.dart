import 'package:dio/dio.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/weather_detail_model.dart';
import 'package:weather_app/domain/models/position_model.dart';
import 'package:weather_app/domain/reponsitories/weather_api.dart';

// trien khai phuong thuc

class WeatherApiImp implements WeatherApi {
  @override
  Future<WeatherData> getWeatherCurrentImp(PositionModel position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=${MyKey.apiToken}');
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WeatherDetail>> getWeatherDetailImp(PositionModel position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=${MyKey.apiToken}');
      List data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
