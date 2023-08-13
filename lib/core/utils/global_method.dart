import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/grocery_admin_panel.dart';

import '../components/text_widget.dart';

class GlobalMethods {
  static navigateTo({required String routeName}) {
    Navigator.pushNamed(GroceryAdminPanel.navigatorKey.currentContext!,routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
   
  }) async {
    await showDialog(
        context:GroceryAdminPanel.navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title),
            ]),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Cancel',
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  fct();
                },
                child: TextWidget(
                  color: Colors.red,
                  text: 'OK',
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }
}
