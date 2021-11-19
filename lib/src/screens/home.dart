import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather/src/controller/global_controller.dart';
import 'package:weather/src/widgets/header.dart';
import 'package:weather/src/widgets/current_weather.dart';
import 'package:weather/src/widgets/hourly_forecast.dart';
import 'package:weather/src/widgets/next_week_forecast.dart';
import 'package:weather/src/widgets/comfort_level.dart';
import 'package:weather/src/widgets/wind.dart';

class HomePage extends StatelessWidget {
  final GlobalController weatherController =
      Get.put(GlobalController(), permanent: true);

  List<Color> cores = [
    const Color(0xffC661FF),
    const Color(0xff467BFF),
  ];

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
                    NextWeekForecast(
                      dailyWeather:
                          weatherController.getData().getdailyWeather(),
                    ),
                    ComfortLevel(
                      cores: cores,
                      currentWeather:
                          weatherController.getData().getCurrentData(),
                    ),
                    Container(
                      height: 1,
                      color: Color(0xffE4E4EE),
                    ),
                    Wind(
                        currentWeather:
                            weatherController.getData().getCurrentData()),
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
