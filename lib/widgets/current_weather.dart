import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';

class CurrentWeather extends StatefulWidget {
  final String locationName;
  final Forecast weatherData;

  const CurrentWeather({Key key, this.locationName, this.weatherData})
      : super(key: key);

  @override
  _CurrentWeatherState createState() =>
      _CurrentWeatherState(this.locationName, this.weatherData);
}

class _CurrentWeatherState extends State<CurrentWeather> {
  String _locationName;
  Forecast _weatherData;

  _CurrentWeatherState(String locationName, Forecast weatherData) {
    this._locationName = locationName;
    this._weatherData = weatherData;
  }

  void _setCurrentWeatherData(String locationName, Forecast weatherData) {
    setState(() {
      this._locationName = locationName;
      this._weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setCurrentWeatherData(_locationName, _weatherData);

    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(this._locationName, style: TextStyle(fontSize: 15)),
            Text(
              getDatetimeFromTimestamp(_weatherData.currently.time),
              style: TextStyle(fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage(
                        getweatherIconLocation(_weatherData.currently.icon))),
                Text(
                  _weatherData.currently.temperature.toInt().toString() + " C",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Text(
              _weatherData.currently.summary,
              style: TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
