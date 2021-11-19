import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather/src/models/weather_data_daily.dart';
import 'package:weather/src/widgets/daily_list.dart';

class NextWeekForecast extends StatelessWidget {
  final DailyWeather? dailyWeather;

  const NextWeekForecast({
    Key? key,
    this.dailyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xffF4F4F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(55),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(55),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Next Days',
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 17,
              ),
            ),
          ),
          DailyList(
            dailyWeather: dailyWeather?.daily,
          ),
        ],
      ),
    );
  }
}
