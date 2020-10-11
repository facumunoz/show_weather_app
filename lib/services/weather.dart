import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

const apiKey = '418dad812e0450f2c3fa009048bab286';
const weatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkingBrain networkingBrain =
        NetworkingBrain('$weatherurl?q=$cityName&appid=$apiKey&units=metric');
    var weatherdata = await networkingBrain.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    print('into weather');
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    NetworkingBrain networkingBrain = NetworkingBrain(
        '$weatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherdata = await networkingBrain.getData();
    print('got from weather');
    return weatherdata;
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
