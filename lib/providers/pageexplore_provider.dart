import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => this._currentIndex;

  set currentIndex(int value) {
    this._currentIndex = value;
    notifyListeners();
  }
}
