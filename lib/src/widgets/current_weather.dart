import 'package:flutter/material.dart';
import 'package:weather/src/models/weather_data_current.dart';
import 'package:weather/src/widgets/temperature_area.dart';
import 'package:weather/src/widgets/current_more_details.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent? currentWeather;

  const CurrentWeather({
    Key? key,
    this.currentWeather,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: Column(
            children: [
              TemperatureArea(
                currentWeather: currentWeather?.current,
              ),
              const SizedBox(height: 20),
              CurrentMoreDetails(
                currentWeather: currentWeather?.current,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
