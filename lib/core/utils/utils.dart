import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/grocery_admin_panel.dart';
import 'package:provider/provider.dart';

import '../../config/theme/controller/dark_theme_provider.dart';


class Utils {
  bool get getTheme => Provider.of<DarkThemeProvider>(GroceryAdminPanel.navigatorKey.currentContext!).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(GroceryAdminPanel.navigatorKey.currentContext!).size; 
}
