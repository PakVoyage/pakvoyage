import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier {
  bool _isISb = false;
  bool get isISb => _isISb;

  bool _isKar = false;
  bool get isKar => _isKar;

  bool _isLhr = false;
  bool get isLhr => _isLhr;

  bool _isMul = false;
  bool get isMul => _isMul;

  bool _isQue = false;
  bool get isQue => _isQue;

  void openCity(String city) {
    _isISb = city == 'ISB';
    _isKar = city == 'Kar';
    _isLhr = city == 'Lhr';
    _isMul = city == 'Mul';
    _isQue = city == 'Que';
    notifyListeners();
  }
}
