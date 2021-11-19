import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/src/models/weather_data_current.dart';

class CurrentMoreDetails extends StatelessWidget {
  final Current? currentWeather;

  const CurrentMoreDetails({
    Key? key,
    this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F8),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: SvgPicture.asset(
                'assets/icons/ventos.svg',
                alignment: Alignment.center,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F8),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: SvgPicture.asset(
                'assets/icons/nuvem.svg',
                alignment: Alignment.center,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F8),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: SvgPicture.asset(
                'assets/icons/umidade.svg',
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20,
              width: 60,
              child: Text(
                '${currentWeather?.windSpeed}km/h',
                style: const TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 20,
              width: 60,
              child: Text(
                '${currentWeather?.clouds}%',
                style: const TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 20,
              width: 60,
              child: Text(
                '${currentWeather?.humidity}%',
                style: const TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
