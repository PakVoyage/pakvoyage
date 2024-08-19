import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  // isLogin

  bool _isLogin = true;
  bool get isLogin => _isLogin;

  bool _isNext = false;
  bool get isNext => _isNext;

  void checkLogin(bool val) {
    if (val == false) {
      _isLogin = false;
    } else {
      _isLogin = true;
    }
    notifyListeners();
  }

  void startLoad(bool val) {
    if (val == true) {
      _isNext = true;
    } else {
      _isNext = false;
    }
    notifyListeners();
  }
}
