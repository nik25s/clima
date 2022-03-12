import 'package:clima/service/location.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/service/networking.dart';

const apikey = '84c77b0a6c6eca0f2cec59fd38201f08';

class WeatherModel {
  Future<dynamic> getCityname(String cityName) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getweatherlocation() async {
    location lc = location();
    await lc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${lc.latitudes}&lon=${lc.longitudes}&appid=$apikey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
