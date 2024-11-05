import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/presentation/controllers/weather_controller.dart';

class DetailPage extends GetView<WeatherController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          if (controller.listDetail.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // TODO
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  const SizedBox(
                    width: 15,
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '${controller.nameCity} Capital',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [
                Icon(Icons.search),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, index) {
                DateTime dateTime = DateTime.parse(controller.listDetail[index].dtTxt);
                String formatDay = DateFormat('EEEE').format(dateTime);
                String formatTime = DateFormat('HH:mm').format(dateTime);
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                createTemp(controller.listDetail[index].main.temp, size: 24),
                                const SizedBox(width: 11),
                                Text(
                                  controller.listDetail[index].weather.main,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              formatDay,
                              style: const TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              formatTime,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 4,
                        child: Image.asset(
                          AssetCustom.getLinkImg(controller.listDetail[index].weather.main),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, _) => const SizedBox(height: 15),
              itemCount: controller.listDetail.length,
            ),
          );
        }));
  }
}
