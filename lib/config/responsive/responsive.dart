import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/grocery_admin_panel.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile() =>
      MediaQuery.of(GroceryAdminPanel.navigatorKey.currentContext!).size.width <
      850;

  static bool isDesktop() =>
      MediaQuery.of(GroceryAdminPanel.navigatorKey.currentContext!)
          .size
          .width >=
      1100;

  @override
  Widget build(BuildContext context) {
    if (isDesktop()) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
