import 'package:flutter/material.dart';

class HeightProvider with ChangeNotifier {
  double _height = 1;
  double get height => _height;

  set height(double val) {
    _height = val;
    notifyListeners();
  }
}
