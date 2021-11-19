import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:weather/src/models/weather_data_daily.dart';

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
                        child: SvgPicture.asset(
                          'assets/icons/nuvemcomsol.svg',
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
