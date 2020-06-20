import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';

class WeatherDetails extends StatefulWidget {
  final DailyDataPoint dailyDataPoint;
  final CurrentlyDataPoint currentlyDataPoint;

  const WeatherDetails({Key key, this.dailyDataPoint, this.currentlyDataPoint})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _WeatherDetailsState(this.dailyDataPoint, this.currentlyDataPoint);
}

class _WeatherDetailsState extends State<WeatherDetails> {
  DailyDataPoint _dailyDataPoint;
  CurrentlyDataPoint _currentlyDataPoint;

  _WeatherDetailsState(
      DailyDataPoint dailyDataPoint, CurrentlyDataPoint currentlyDataPoint) {
    this._dailyDataPoint = dailyDataPoint;
    this._currentlyDataPoint = currentlyDataPoint;

    void _setWeatherDetailsData(
        DailyDataPoint dailyDataPoint, CurrentlyDataPoint currentlyDataPoint) {
      this._dailyDataPoint = dailyDataPoint;
      this._currentlyDataPoint = currentlyDataPoint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Details",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Container(
              decoration: new BoxDecoration(
                  color: Colors.lightBlue[300],
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10))),
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sunrise",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(getTimeFromTimestamp(_dailyDataPoint.sunriseTime),
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Sunset",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text(getTimeFromTimestamp(_dailyDataPoint.sunsetTime),
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Humidity",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text(
                          (_currentlyDataPoint.humidity * 100)
                                  .toInt()
                                  .toString() +
                              " %",
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Windspeed",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text(
                          (_currentlyDataPoint.windSpeed * 3.6)
                                  .toInt()
                                  .toString() +
                              " km/h",
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Visibility",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text(
                          _currentlyDataPoint.visibility.toInt().toString() +
                              " Kms",
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
