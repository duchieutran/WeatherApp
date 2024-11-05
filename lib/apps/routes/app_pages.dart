// dinh nghia tung page
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/apps/routes/app_routes.dart';
import 'package:weather_app/presentation/controllers/bindding.dart';
import 'package:weather_app/presentation/pages/details/detail_page.dart';

import '../../presentation/pages/homes/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.root,
      page: () => const HomePage(),
      binding: WeatherBinddings(), // khởi tạo bindding trước khi vào HomePage
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
    ),
  ];
}
