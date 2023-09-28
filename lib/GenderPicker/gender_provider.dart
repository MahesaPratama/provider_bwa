import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier {
  bool _isMale = true;
  bool get isMale => _isMale;

  set isMale(bool newVal) {
    _isMale = newVal;
    notifyListeners();
  }

  get color => _isMale ? Colors.blue : Colors.pink;
  get maleColor => _isMale ? Colors.blue : Colors.grey;
  get femaleColor => _isMale ? Colors.grey : Colors.pink;
}
