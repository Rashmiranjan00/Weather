import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/src/api/weather.dart';
import 'package:weather/src/models/weather_data.dart';

class GlobalController extends GetxController {
  final _weatherData = WeatherData().obs;
  final _cardIndex = 0.obs;
  final RxBool _isLoading = true.obs;

  final RxDouble _lat = 0.0.obs;
  final RxDouble _lon = 0.0.obs;

  @override
  void onInit() {
    if (_isLoading.value == true) {
      _fetchLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  _fetchLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location not enabled');

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .then((value) {
      _lat.value = value.latitude;
      _lon.value = value.longitude;
      return WeatherApiManager()
          .processData(value.latitude, value.longitude)
          .then((value) {
        _weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  WeatherData getData() {
    return _weatherData.value;
  }

  RxBool loadingCheck() => _isLoading;

  RxDouble getLatitute() => _lat;
  RxDouble getLongitude() => _lon;

  RxInt getIndex() {
    // print('Getting Index');
    return _cardIndex;
  }
}
