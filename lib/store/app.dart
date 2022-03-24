import 'package:flutter/material.dart';

class App with ChangeNotifier {
  bool showSidebar = true;

  toggleSidebar() {
    showSidebar = !showSidebar;
    notifyListeners();
  }
}

final App app = App();
