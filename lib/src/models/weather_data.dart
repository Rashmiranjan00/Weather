import 'package:weather/src/models/weather_data_current.dart';
import 'package:weather/src/models/weather_data_hourly.dart';
import 'package:weather/src/models/weather_data_daily.dart';

class WeatherData {
  WeatherData([this._current, this._daily, this._hourly]);
  final WeatherDataCurrent? _current;
  final DailyWeather? _daily;
  final HourlyWeather? _hourly;

  WeatherDataCurrent getCurrentData() => _current!;
  DailyWeather getdailyWeather() => _daily!;
  HourlyWeather getHourlyWeather() => _hourly!;
}
