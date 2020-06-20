import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';

class HourlyWeather extends StatefulWidget {
  final HourlyDataBlock hourlyDataBlock;

  const HourlyWeather({Key key, this.hourlyDataBlock}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _HourlyWeatherState(this.hourlyDataBlock);
}

class _HourlyWeatherState extends State<HourlyWeather> {
  HourlyDataBlock _hourlyDataBlock;

  _HourlyWeatherState(HourlyDataBlock hourlyDataBlock) {
    this._hourlyDataBlock = hourlyDataBlock;
  }

  void _setHourlyWeatherData(HourlyDataBlock hourlyDataBlock) {
    setState(() {
      this._hourlyDataBlock = hourlyDataBlock;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setHourlyWeatherData(this._hourlyDataBlock);

    if (_hourlyDataBlock.data.length == 49) {
      _hourlyDataBlock.data.removeAt(0);
    }

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hourly", style: TextStyle(fontSize: 20, color: Colors.white)),
          Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: new BorderRadius.all(const Radius.circular(10))),
            margin: const EdgeInsets.only(top: 10),
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: _hourlyDataBlock.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getTimeFromTimestamp(_hourlyDataBlock.data[index].time),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(getweatherIconLocation(
                                _hourlyDataBlock.data[index].icon)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _hourlyDataBlock.data[index].temperature
                                    .toInt()
                                    .toString() +
                                " C",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _hourlyDataBlock.data[index].summary,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
