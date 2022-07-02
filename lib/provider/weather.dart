import 'package:flutter/material.dart';
import 'package:test_counter_app/services/weather_model.dart';

class Weather extends ChangeNotifier{
  WeatherModel weather = WeatherModel();
  int? _temperature;

  int? get temperature{
    return _temperature;
  }

  void updateWeather(dynamic weather) {
      double temp = weather['main']['temp'];
      _temperature = temp.toInt();
      notifyListeners();
    }
  }
