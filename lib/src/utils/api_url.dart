import 'package:weather/src/api/api_key.dart';

const _baseUrl = 'https://api.openweathermap.org/data/2.5/onecall?';
const _lat = "lat=";
const _lon = "&lon=";
const _units = "&units=metric";
const _exclude = "&exclue=minutely";
const _appid = "&appid=";

String getUrl(var lat, var lon) {
  String _url;
  _url = _baseUrl +
      _lat +
      lat.toString() +
      _lon +
      lon.toString() +
      _units +
      _exclude +
      _appid +
      key;
  return _url;
}
