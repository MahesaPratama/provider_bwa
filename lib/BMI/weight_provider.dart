import 'package:flutter/material.dart';

class WeightProvider with ChangeNotifier {
  double _weight = 1;
  double get weight => _weight;

  set weight(double val) {
    _weight = val;
    notifyListeners();
  }
  
}
