import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/apps/routes/app_routes.dart';
import 'package:weather_app/presentation/controllers/weather_controller.dart';

import 'widgets/home_detail_weather.dart';
import 'widgets/home_location.dart';
import 'widgets/home_temperature.dart';
import 'widgets/home_weather_icon.dart';

class HomePage extends GetView<WeatherController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.detail);
            },
            icon: const Icon(Icons.list)),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(() {
          // Kiểm tra null trước khi hiển thị
          if (controller.weatherData.value.weather == null ||
              controller.weatherData.value.main == null ||
              controller.weatherData.value.wind == null) {
            // Hiển thị vòng quay khi chưa có dữ liệu
            return const CircularProgressIndicator();
          }

          // Khi có dữ liệu, hiển thị giao diện chính
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeWeatherIcon(
                nameIcon: controller.weatherData.value.weather![0].main,
              ),
              HomeTemperature(
                temp: controller.weatherData.value.main!.temp,
              ),
              HomeLocation(
                nameLocation: controller.weatherData.value.name!,
              ),
              const SizedBox(
                height: 40,
              ),
              HomeDetailWeather(
                humidity: controller.weatherData.value.main!.humidity,
                speedWind: controller.weatherData.value.wind!.speed,
              ),
            ],
          );
        }),
      ),
    );
  }
}
