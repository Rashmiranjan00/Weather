import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/src/utils/api_url.dart';
import 'package:weather/src/models/weather_data.dart';
import 'package:weather/src/models/weather_data_current.dart';
import 'package:weather/src/models/weather_data_daily.dart';
import 'package:weather/src/models/weather_data_hourly.dart';

class WeatherApiManager {
  WeatherData? _weatherData;

  Future<WeatherData> processData(var lat, var lon) async {
    var response = await http.get(Uri.parse(getUrl(lat, lon)));

    var jsonString = jsonDecode(response.body);
    // print('response : $jsonString');
    _weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        DailyWeather.fromJson(jsonString), HourlyWeather.fromJson(jsonString));

    return _weatherData!;
  }
}
