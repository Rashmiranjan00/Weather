import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather/src/models/weather_data_current.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent? currentWeather;

  const ComfortLevel({
    Key? key,
    required this.cores,
    this.currentWeather,
  }) : super(key: key);

  final List<Color> cores;

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
            'Comfort Level',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: currentWeather!.current!.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    animationEnabled: true,
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 12,
                      progressBarWidth: 12,
                    ),
                    size: 130,
                    customColors: CustomSliderColors(
                      progressBarColors: cores,
                      trackColor: const Color(0xffF4F4F8),
                      dynamicGradient: true,
                      hideShadow: true,
                    ),
                    infoProperties: InfoProperties(
                        mainLabelStyle: const TextStyle(
                          letterSpacing: 0.1,
                          height: 1.0,
                          fontSize: 27,
                          fontFamily: 'MohrRounded',
                        ),
                        bottomLabelText: ('Humidity'),
                        bottomLabelStyle: const TextStyle(
                          letterSpacing: 0.1,
                          height: 1.4,
                          fontSize: 14,
                          fontFamily: 'MohrRounded',
                        )),
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
                          text: 'Feels Like ',
                          style: TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xffBDBCE1),
                          ),
                        ),
                        TextSpan(
                          text:
                              '${currentWeather!.current!.feelsLike!.toInt()}°',
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
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    height: 25,
                    width: 1,
                    color: const Color(0xffE4E4EE),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'UV Index ',
                          style: TextStyle(
                            fontFamily: 'MohrRounded',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 0.8,
                            color: Color(0xffBDBCE1),
                          ),
                        ),
                        TextSpan(
                          text:
                              '${currentWeather!.current!.feelsLike!.toInt()}',
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
}
