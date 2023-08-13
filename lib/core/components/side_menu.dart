import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/components/text_widget.dart';
import 'package:groceryapp_admin_panel/modules/All_orders/view/all_orders_screen.dart';
import 'package:groceryapp_admin_panel/modules/Allproducts/view/all_products.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../../config/theme/controller/dark_theme_provider.dart';
import '../../modules/Main_Screen/view/main_screen.dart';
import '../utils/utils.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final theme = Utils().getTheme;
   // final drawerKey=GlobalKey();
    //   final color = Utils(context).color;
    return Drawer(
      //key: drawerKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/groceries.png",
            ),
          ),
          DrawerListTile(
            title: "Main",
            press: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all product",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AllProductsScreen(),
                ),
              );
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "View all order",
            press: () {
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AllOrdersScreen(),
                ),
              );
            },
            icon: IconlyBold.bag2,
          ),
          Consumer<DarkThemeProvider>(
            builder: (_, DarkThemeProvider controller, child) => SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 26.sp,
                  ),
                ),
                secondary: Padding(
                  padding:
                      const EdgeInsets.only(left: AppConstant.defaultPadding),
                  child: Icon(
                    controller.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  ),
                ),
                value: theme,
                onChanged: controller.changedtheme),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Utils().getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: color,
        ));
  }
}
