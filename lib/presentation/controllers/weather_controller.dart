import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/reponsitories/weather_api_imp.dart';
import 'package:weather_app/presentation/controllers/app_controller.dart';

class WeatherController extends GetxController {
  final nameCity = "".obs;
  var weatherData = WeatherData().obs;

  @override
  void onInit() {
    super.onInit();
    getWeatherCurrent();
  }

  Future<void> getWeatherCurrent() async {
    try {
      // TODO : (Quan trong) gọi lại AppController thì mới dùng được position trong AppController
      final a = Get.find<AppController>();
      // truyền biến position (vì là getX nên dùng .value để truyền giá trị )
      final result =
          await WeatherApiImp().getWeatherCurrentImp(a.position.value);
      // Đoạn dưới này chắc không cần comment
      weatherData.value = result;
      nameCity.value = weatherData.value.name!;
    } catch (e) {
      weatherData.value =
          WeatherData(); // Bạn có thể thêm log lỗi ở đây nếu cần
    }
  }
}
