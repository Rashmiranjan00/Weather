import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:weather/src/models/weather_data_hourly.dart';
import 'package:weather/src/controller/global_controller.dart';
import 'package:weather/src/utils/weather_icons.dart';

class HourlyList extends StatelessWidget {
  final List<Hourly>? hourlyWeather;

  HourlyList({
    Key? key,
    this.hourlyWeather,
  }) : super(key: key);

  final GlobalController controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    RxInt cardIndex = controller.getIndex();

    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeather!.length > 12 ? 12 : hourlyWeather!.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    width: 90,
                    decoration: BoxDecoration(
                      gradient: cardIndex.value == index
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff467BFF),
                                Color(0xffC661FF),
                              ],
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30.0,
                          spreadRadius: 1,
                          color: const Color(0xffE4E4EE).withAlpha(150),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(38),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(38),
                      ),
                    ),
                    child: HourlyDetails(
                      temp: hourlyWeather![index].temp,
                      day: hourlyWeather![index].dt,
                      weatherdesp:
                          hourlyWeather![index].weather![0].description,
                      weathermain: hourlyWeather![index].weather![0].main,
                    ),
                  ),
                ));
          }),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final temp, day, weatherdesp, weathermain;

  const HourlyDetails({
    Key? key,
    this.temp,
    this.day,
    this.weatherdesp,
    this.weathermain,
  }) : super(key: key);

  String getTime(var day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(day),
            style: const TextStyle(
              color: Color(0xff171717),
              fontSize: 10,
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          child: BoxedIcon(
            WeatherIcons.fromString(selectIcon('$weathermain'),
                // Fallback is optional, throws if not found, and not supplied.
                fallback: WeatherIcons.na),
            size: 20,
            color: const Color.fromARGB(255, 189, 188, 225),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '${temp.toInt()}°',
            style: const TextStyle(
              color: Color(0xff171717),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
