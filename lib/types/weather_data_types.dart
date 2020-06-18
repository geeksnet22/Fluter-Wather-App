import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:geocoder/geocoder.dart';

class FormattedHourlyWeatherDataBlock {
  List<FormattedHourlyWeatherData> hourlyWeatherDataList;

  FormattedHourlyWeatherDataBlock(Forecast forecast) {
    List<HourlyDataPoint> hourlyDataPoints = forecast.hourly.data;

    for (int i = 0; i < hourlyDataPoints.length; i++) {
      FormattedHourlyWeatherData formattedHourlyWeatherData =
          new FormattedHourlyWeatherData();
    }
  }
}

class FormattedHourlyWeatherData {
//  FormattedHourlyWeatherData

}

class FormattedDailyWeatherDataBlock {}

class FormattedDailyWeatherData {}
