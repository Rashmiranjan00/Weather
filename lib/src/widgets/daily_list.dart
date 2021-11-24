import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:weather/src/models/weather_data_daily.dart';
import 'package:weather/src/utils/weather_icons.dart';

class DailyList extends StatelessWidget {
  final List<Daily>? dailyWeather;

  const DailyList({
    Key? key,
    this.dailyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getTime(var day) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
      String x = DateFormat('EEEE').format(time);
      return x;
    }

    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dailyWeather!.length > 7 ? 7 : dailyWeather!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          getTime(dailyWeather![index].dt),
                          style: const TextStyle(
                            color: Color(0xff171717),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: BoxedIcon(
                          WeatherIcons.fromString(
                              selectIcon(
                                  '${dailyWeather![index].weather![0].main}'),
                              // Fallback is optional, throws if not found, and not supplied.
                              fallback: WeatherIcons.na),
                          size: 20,
                          color: const Color(0xff83839D),
                        ),
                      ),
                      Text(
                        '${dailyWeather![index].temp!.max!.toInt()}°/${dailyWeather![index].temp!.min!.toInt()}°',
                        style: const TextStyle(
                          color: Color(0xff171717),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: const Color(0xffE4E4EE),
                ),
              ],
            );
          }),
    );
  }
}
