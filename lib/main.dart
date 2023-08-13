import 'package:flutter/material.dart';

import 'core/utils/service_locator.dart';
import 'grocery_admin_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const GroceryAdminPanel());
}
