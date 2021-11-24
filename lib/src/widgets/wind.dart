import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather/src/models/weather_data_current.dart';

class Wind extends StatelessWidget {
  final WeatherDataCurrent? currentWeather;

  const Wind({
    Key? key,
    this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var direction =
        getCardinalDirection('${currentWeather!.current!.windDegree}');

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'Wind',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 140,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30, top: 5),
                  height: 60,
                  width: 60,
                  child: SvgPicture.asset(
                    'assets/icons/vento.svg',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Direction',
                          style: TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xffBDBCE1),
                          ),
                        ),
                        TextSpan(
                          text: ' $direction',
                          style: const TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xff171717),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 35,
                      right: 35,
                    ),
                    height: 25,
                    width: 1,
                    color: const Color(0xffE4E4EE),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Speed ',
                          style: TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xffBDBCE1),
                          ),
                        ),
                        TextSpan(
                          text: '${currentWeather!.current!.windSpeed} km/h',
                          style: const TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xff171717),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  getCardinalDirection(String angle) {
    const directions = [
      'North',
      'NE',
      'East',
      'SE',
      'South',
      'SW',
      'West',
      'NW'
    ];
    // return directions[Math.round(angle / 45) % 8];
    return directions[
        int.parse((num.parse(angle) / 45).toStringAsFixed(0)) % 8];
  }
}
