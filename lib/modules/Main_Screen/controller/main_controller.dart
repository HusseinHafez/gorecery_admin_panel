import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/grocery_admin_panel.dart';
import 'package:provider/provider.dart';

class MainController extends ChangeNotifier{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   static MainController get(BuildContext context)=>Provider.of(context);
   GlobalKey<ScaffoldState> get getScaffoldKey => _scaffoldKey;

    void controlDashboarkMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }else{
      _scaffoldKey.currentState!.closeDrawer();
      Navigator.pop(GroceryAdminPanel.navigatorKey.currentContext!);
    }
  }
}