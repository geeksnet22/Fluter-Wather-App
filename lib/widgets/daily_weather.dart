import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';

class DailyWeather extends StatefulWidget {
  final DailyDataBlock dailyDataBlock;

  const DailyWeather({Key key, this.dailyDataBlock}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _DailyWeatherState(this.dailyDataBlock);
}

class _DailyWeatherState extends State<DailyWeather> {
  DailyDataBlock _dailyDataBlock;

  _DailyWeatherState(DailyDataBlock dailyDataBlock) {
    this._dailyDataBlock = dailyDataBlock;
  }

  void _setDailyWeatherData(DailyDataBlock dailyDataBlock) {
    setState(() {
      this._dailyDataBlock = dailyDataBlock;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setDailyWeatherData(_dailyDataBlock);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Daily",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: new BorderRadius.all(const Radius.circular(10))),
            margin: const EdgeInsets.only(top: 10),
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: _dailyDataBlock.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 150,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        getDayFromTimestamp(_dailyDataBlock.data[index].time) ==
                                getDayFromTimestamp(
                                    new DateTime.now().millisecondsSinceEpoch ~/
                                        1000)
                            ? "Today"
                            : getDayFromTimestamp(
                                _dailyDataBlock.data[index].time),
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(getweatherIconLocation(
                                _dailyDataBlock.data[index].icon)),
                          ),
                          Text(
                            _dailyDataBlock.data[index].temperatureMin
                                    .toInt()
                                    .toString() +
                                " C - " +
                                _dailyDataBlock.data[index].temperatureMax
                                    .toInt()
                                    .toString() +
                                " C",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
