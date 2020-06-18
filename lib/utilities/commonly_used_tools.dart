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
  return new DateTime.fromMillisecondsSinceEpoch(timestamp*1000).toString();
}