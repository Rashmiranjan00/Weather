class WeatherDataCurrent {
  WeatherDataCurrent({
    this.current,
  });

  Current? current;

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
        current: Current.fromJson(json['current']),
      );

  Map<String, dynamic> toJson() => {
        'current': current?.toJson(),
      };
}

class Current {
  Current({
    this.dt,
    this.windSpeed,
    this.temp,
    this.humidity,
    this.clouds,
    this.weather,
  });

  int? dt;
  double? windSpeed;
  double? temp;
  int? humidity;
  int? clouds;
  List<Weather>? weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
      dt: json['dt'],
      windSpeed: json['wind_speed'].toDouble(),
      humidity: json['humidity'],
      clouds: json['clouds'],
      temp: json['temp'],
      weather:
          List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'windSpeed': windSpeed,
        'humidity': humidity,
        'clouds': clouds,
        'temp': temp,
        'weather': List<dynamic>.from(weather!.map((x) => x.toJson()))
      };
}

class Weather {
  Weather({
    this.description,
    this.icon,
  });

  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      Weather(description: json['description'], icon: json['icon']);

  Map<String, dynamic> toJson() => {
        'description': description,
        'icon': icon,
      };
}
