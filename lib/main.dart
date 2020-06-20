import 'package:flutter/material.dart';
import 'package:the_weather_app/widgets/current_weather.dart';
import 'package:the_weather_app/widgets/daily_weather.dart';
import 'package:the_weather_app/widgets/hourly_weather.dart';
import 'utilities/extract_data.dart';
import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:the_weather_app/widgets/weather_details.dart';

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Favorite Locations'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              )
            ],
          ),
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
                              WeatherDetails(
                                  dailyDataPoint:
                                      (snapshot.data.elementAt(1) as Forecast)
                                          .daily
                                          .data
                                          .first,
                                  currentlyDataPoint:
                                      (snapshot.data.elementAt(1) as Forecast)
                                          .currently),
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
