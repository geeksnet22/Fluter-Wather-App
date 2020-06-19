import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';

class CurrentWeather extends StatefulWidget {
  final String locationName;
  final CurrentlyDataPoint currentlyDataPoint;

  const CurrentWeather({Key key, this.locationName, this.currentlyDataPoint})
      : super(key: key);

  @override
  _CurrentWeatherState createState() =>
      _CurrentWeatherState(this.locationName, this.currentlyDataPoint);
}

class _CurrentWeatherState extends State<CurrentWeather> {
  String _locationName;
  CurrentlyDataPoint _currentlyDataPoint;

  _CurrentWeatherState(String locationName, CurrentlyDataPoint currentlyDataPoint) {
    this._locationName = locationName;
    this._currentlyDataPoint = currentlyDataPoint;
  }

  void _setCurrentWeatherData(String locationName, CurrentlyDataPoint currentlyDataPoint) {
    setState(() {
      this._locationName = locationName;
      this._currentlyDataPoint = currentlyDataPoint;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setCurrentWeatherData(_locationName, _currentlyDataPoint);

    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(this._locationName, style: TextStyle(fontSize: 20)),
            Text(
              getDatetimeFromTimestamp(_currentlyDataPoint.time),
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage(
                        getweatherIconLocation(_currentlyDataPoint.icon))),
                Text(
                  _currentlyDataPoint.temperature.toInt().toString() + " C",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Text(
              _currentlyDataPoint.summary,
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}
