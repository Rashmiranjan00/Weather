import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather/src/controller/global_controller.dart';
import 'package:weather/src/widgets/header.dart';
import 'package:weather/src/widgets/current_weather.dart';
import 'package:weather/src/widgets/hourly_forecast.dart';

class HomePage extends StatelessWidget {
  final GlobalController weatherController =
      Get.put(GlobalController(), permanent: true);

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => weatherController.loadingCheck().isFalse
            ? Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const Header(),
                    CurrentWeather(
                      currentWeather:
                          weatherController.getData().getCurrentData(),
                    ),
                    HourlyForecast(
                      hourlyWeather:
                          weatherController.getData().getHourlyWeather(),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    ));
  }
}
