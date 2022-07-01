import 'package:flutter/material.dart';
import 'package:test_counter_app/providers/change_theme.dart';

class Counter extends ChangeNotifier {
  var _count = 0;

  int get getCounter {
    return _count;
  }

  bool get isDarkTheme => ChangesTheme.instance.isDarkTheme;

  void incrementCounter() {
    if(_count == 10){
      _nothing();
    } else if(isDarkTheme){
      _count += 2;
      notifyListeners();
    }else
    {
    _count += 1;
    notifyListeners();
  }}

  void decrementCounter(){
    if(_count == 0){
      _nothing();
    }else if(isDarkTheme){
      _count -= 2;
      notifyListeners();
    }else{
    _count -= 1;
    notifyListeners();
  }}

  void _nothing(){}
}
