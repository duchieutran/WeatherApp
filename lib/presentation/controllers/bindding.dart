import 'package:get/get.dart';
import 'package:weather_app/presentation/controllers/weather_controller.dart';

class WeatherBinddings extends Bindings {
  // khởi tạo WeatherController với phương thức getWeatherCurrent
  @override
  void dependencies() {
    Get.put<WeatherController>(WeatherController()).getWeatherCurrent();
  }
}

/// mở file WeatherController ra đọc trước, sau khi khi chạy hết controller thì
/// màn hình mới được khởi chạy => Vào màn hình Home (lúc này api có thể trả chậm, phải sử lý giống trước bạn sử lý)
/// Có thể thêm icon load hoặc .... gì đấy nói chung là vào trong HomePage là thấy
