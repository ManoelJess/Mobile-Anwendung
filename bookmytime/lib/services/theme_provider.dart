import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
  Blue,
  Yellow,
  Green,
  Red,
  Grey,
}

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.Light:
        _currentTheme = ThemeData.light();
        break;
      case AppTheme.Dark:
        _currentTheme = ThemeData.dark();
        break;
      case AppTheme.Blue:  
        _currentTheme = ThemeData(
          primaryColor: Colors.blue,
        );
        break;
      case AppTheme.Yellow:  
        _currentTheme = ThemeData(
          primaryColor: Colors.yellow,
        );
        break;
      case AppTheme.Green:  
        _currentTheme = ThemeData(
          primaryColor: Colors.green,
        );
        break;
      case AppTheme.Red:  
        _currentTheme = ThemeData(
          primaryColor: Colors.red,
        );
        break;
      case AppTheme.Grey:  
        _currentTheme = ThemeData(
          primaryColor: Colors.grey,
        );
        break;
      default:
        _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
