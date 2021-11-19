import 'package:flutter/material.dart';
import 'package:weather/src/models/weather_data_hourly.dart';
import 'package:weather/src/widgets/hourly_list.dart';

class HourlyForecast extends StatelessWidget {
  final HourlyWeather? hourlyWeather;

  const HourlyForecast({
    Key? key,
    this.hourlyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        HourlyList(
          hourlyWeather: hourlyWeather?.hourly,
        ),
      ],
    );
  }
}
