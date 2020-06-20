import 'package:flutter/material.dart';
import 'package:the_weather_app/utilities/commonly_used_tools.dart';
import 'package:the_weather_app/widgets/current_weather.dart';
import 'package:the_weather_app/widgets/daily_weather.dart';
import 'package:the_weather_app/widgets/hourly_weather.dart';
import 'utilities/extract_data.dart';
import 'package:darksky_weather/darksky_weather_io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weaher app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> _weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weatherData = getForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FutureBuilder<List>(
                      future: _weatherData,
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: <Widget>[
                              CurrentWeather(
                                locationName: snapshot.data.elementAt(0),
                                currentlyDataPoint:
                                    (snapshot.data.elementAt(1) as Forecast)
                                        .currently,
                              ),
                              HourlyWeather(
                                hourlyDataBlock:
                                    (snapshot.data.elementAt(1) as Forecast)
                                        .hourly,
                              ),
                              DailyWeather(
                                dailyDataBlock:
                                    (snapshot.data.elementAt(1) as Forecast)
                                        .daily,
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.lightBlue[300],
                                            borderRadius: new BorderRadius.all(
                                                const Radius.circular(10))),
                                        margin: const EdgeInsets.only(top: 10),
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Sunrise",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                    getTimeFromTimestamp((snapshot
                                                                    .data
                                                                    .elementAt(
                                                                        1)
                                                                as Forecast)
                                                            .daily
                                                            .data
                                                            .first
                                                            .sunriseTime)
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Sunset",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white)),
                                                Text(
                                                    getTimeFromTimestamp(
                                                        (snapshot.data
                                                                    .elementAt(
                                                                        1)
                                                                as Forecast)
                                                            .daily
                                                            .data
                                                            .first
                                                            .sunsetTime),
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Humidity",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white)),
                                                Text(
                                                    (((snapshot.data.elementAt(1)
                                                                            as Forecast)
                                                                        .currently
                                                                        .humidity *
                                                                    100)
                                                                .toInt())
                                                            .toString() +
                                                        " %",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Windspeed",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white)),
                                                Text(
                                                    (((snapshot.data.elementAt(
                                                                            1)
                                                                        as Forecast)
                                                                    .currently
                                                                    .windSpeed) *
                                                                3.6)
                                                            .toInt()
                                                            .toString() +
                                                        " km/h",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Visibility",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white)),
                                                Text(
                                                    (snapshot.data.elementAt(1)
                                                                as Forecast)
                                                            .currently
                                                            .visibility
                                                            .toInt()
                                                            .toString() +
                                                        " Kms",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white))
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                        return Text('');
                      })
                ],
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
