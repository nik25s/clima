import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class location {
  double? latitudes;
  double? longitudes;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.low);
      latitudes = position.latitude;
      longitudes = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
