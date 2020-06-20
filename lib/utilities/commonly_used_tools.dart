import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getweatherIconLocation(String iconDesc) {
  String weatherIconLocation = "assets/images/";
  switch (iconDesc) {
    case "clear-day":
      weatherIconLocation += "hot_sun_day";
      break;
    case "clear-night":
      weatherIconLocation += "moon_night_sky";
      break;
    case "partly-cloudy-day":
      weatherIconLocation += "sunny_sun_cloudy";
      break;
    case "partly-cloudy-night":
      weatherIconLocation += "moon_night_cloud";
      break;
    case "cloudy":
      weatherIconLocation += "cloudy_season_cloud";
      break;
    case "rain":
      weatherIconLocation += "rain_cloud_climate";
      break;
    case "fog":
      weatherIconLocation += "cloudy_season_cloud";
      break;
    case "snow":
      weatherIconLocation += "cloud_snowing_cloud_climate";
      break;
    default:
      weatherIconLocation = "rain_cloud_climate";
  }
  return weatherIconLocation + ".png";
}

String getDatetimeFromTimestamp(int timestamp) {
  return DateFormat("yyyy-MM-dd hh:mm:ss a")
      .format(new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
}

String getTimeFromTimestamp(int timestamp) {
  return DateFormat("hh:mm a")
      .format(new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
}

String getDayFromTimestamp(int timestamp) {
  return DateFormat('EEEE')
      .format(new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
}
