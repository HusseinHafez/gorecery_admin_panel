import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsController extends ChangeNotifier{

  static AllProductsController get (BuildContext context)=>Provider.of(context);
  final GlobalKey<ScaffoldState> _gridScaffoldKey = GlobalKey<ScaffoldState>(); 
  GlobalKey<ScaffoldState> get getgridscaffoldKey => _gridScaffoldKey;
  
  void controlProductsMenu() {
    if (!_gridScaffoldKey.currentState!.isDrawerOpen) {
      _gridScaffoldKey.currentState!.openDrawer();
    }
  }
}