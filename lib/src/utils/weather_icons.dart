String selectIcon(String main) {
  int now = DateTime.now().hour.toInt();
  var prefix = 'wi-';
  var dorn = '';
  if (now >= 4 && now < 19) {
    //Day time
    dorn = "day-";
  } else {
    //Night time
    dorn = "night-";
  }
  if (main == 'Clouds') {
    main = 'cloudy';
  }
  if (main == 'Clear') {
    main = 'sunny';
  }
  return prefix + dorn + main.toLowerCase();
}
