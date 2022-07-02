import 'package:test_counter_app/services/location.dart';
import 'package:test_counter_app/services/networking.dart';

const apiKey = 'a0d640bd31428732a3aabc91ae021111';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');


    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}

