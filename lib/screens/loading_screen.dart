import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/service/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/service/networking.dart';

const apikey = '84c77b0a6c6eca0f2cec59fd38201f08';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location lc = location();
    await lc.getCurrentLocation();
    latitude = lc.latitudes;
    longitude = lc.longitudes;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey");

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}