import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  bool _showTasks = false;

  bool get visibility {
    return _showTasks;
  }

  void show() {
    _showTasks = true;
    notifyListeners();
  }

  void hide() {
    _showTasks = false;
    notifyListeners();
  }
}
