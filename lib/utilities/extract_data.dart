import 'dart:async';
import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:geocoder/geocoder.dart';

const API_KEY = "7d7c4d51abd38384fd51a174d0771a5d";

Future<List> getForecast() async {
  var darksky = new DarkSkyWeather(API_KEY, units: Units.SI);

  var addresses = await Geocoder.local
      .findAddressesFromQuery("mumbai, india");
  String location = addresses.first.addressLine.split(',').first;
  Forecast forecast = await darksky.getForecast(
      addresses.first.coordinates.latitude,
      addresses.first.coordinates.longitude);
  return [location, forecast];
}
