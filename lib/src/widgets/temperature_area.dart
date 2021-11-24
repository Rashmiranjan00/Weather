import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:weather/src/models/weather_data_current.dart';
import 'package:weather/src/utils/weather_icons.dart';

class TemperatureArea extends StatelessWidget {
  final Current? currentWeather;

  const TemperatureArea({
    Key? key,
    this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image.asset(
        //   'assets/weathers/rain-cloud-sun@2x.png',
        //   height: 120,
        // ),
        BoxedIcon(
          WeatherIcons.fromString(
              selectIcon('${currentWeather?.weather![0].main}'),
              // Fallback is optional, throws if not found, and not supplied.
              fallback: WeatherIcons.na),
          size: 80,
          // color: Colors.purple.shade200,
          color: const Color.fromARGB(255, 131, 110, 255),
        ),
        Container(
          height: 50,
          width: 1,
          color: const Color(0xffE4E4EE),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '${currentWeather?.temp?.toInt()}°',
                style: const TextStyle(
                  fontFamily: 'MohrRounded',
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  height: 0.8,
                  color: Color(0xff171717),
                ),
              ),
              TextSpan(
                text: '\n${currentWeather?.weather![0].description}',
                style: const TextStyle(
                  fontFamily: 'MohrRounded',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.8,
                  color: Color(0xffBDBCE1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
