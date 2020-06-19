import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:flutter/cupertino.dart';
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

    return Container(
      height: 50,
      child: ListView.builder(
//        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: _hourlyDataBlock.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Text(getTimeFromTimestamp(_hourlyDataBlock.data[index].time)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(getweatherIconLocation(
                          _hourlyDataBlock.data[index].icon)),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
