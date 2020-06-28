import 'dart:async';
import 'package:darksky_weather/darksky_weather_io.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

const API_KEY = "7d7c4d51abd38384fd51a174d0771a5d";

Future<List> getForecast() async {
  var darksky = new DarkSkyWeather(API_KEY, units: Units.SI);

  Position _location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);



//  var addresses = await Geocoder.local
//      .findAddressesFromQuery("Khanna, India");
  var addresses = await Geocoder.local.findAddressesFromCoordinates(Coordinates(_location.latitude,
      _location.longitude));
  String location = addresses.first.adminArea.split(',').first;
  Forecast forecast = await darksky.getForecast(
      addresses.first.coordinates.latitude,
      addresses.first.coordinates.longitude);
  return [location, forecast];
}
