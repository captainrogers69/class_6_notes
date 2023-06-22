import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class BaseHomeController {
  void configColor(int indexing);
}

class HomeController with ChangeNotifier implements BaseHomeController {
  List<Color> colorOptions = [
    Colors.yellow.shade800,
    Colors.black,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.brown,
    Colors.blue,
    Colors.teal,
    Colors.indigo,
  ];

  Color _primaryColor = Colors.yellow.shade800;
  Color get primaryColor => _primaryColor;

  @override
  void configColor(int indexing) {
    _primaryColor = colorOptions[indexing];
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
