import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/models/position_model.dart';

class AppController extends GetxController {
  var position = PositionModel(0, 0).obs; // khởi tạo theo dõi

  updatePosition(Position a) {
    position.value = PositionModel(a.latitude,
        a.longitude); // gán biến position với giá trị Position được truyền vào
  }
}
