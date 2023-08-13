
import 'package:flutter/material.dart';

import '../../../core/utils/dark_them_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
  void changedtheme(bool value){
    _darkTheme=value;
    setDarkTheme=_darkTheme;
    notifyListeners();
  }
  void getCurrentAppTheme() async {
    setDarkTheme =
        await darkThemePreference.getTheme();
        notifyListeners();
        
  }
}