import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/utils/app_strings.dart';
import 'package:groceryapp_admin_panel/core/utils/constants.dart';
import 'package:groceryapp_admin_panel/core/utils/service_locator.dart';
import 'package:groceryapp_admin_panel/modules/Allproducts/controller/all_products_controller.dart';
import 'package:groceryapp_admin_panel/modules/Main_Screen/controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'config/theme/theme_data.dart';
import 'config/theme/controller/dark_theme_provider.dart';
import 'modules/Main_Screen/view/main_screen.dart';

class GroceryAdminPanel extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const GroceryAdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
        ChangeNotifierProvider(
          create: (_) => getIt<MainController>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<AllProductsController>(),
        ),
        ChangeNotifierProvider(
          create: (_) => DarkThemeProvider()..getCurrentAppTheme(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return ScreenUtilInit(
              designSize: const Size(360, 1400),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner:
                      AppConstant.debugShowCheckedModeBanner,
                  title: AppStrings.appTitle,
                  theme: Styles.themeData(themeProvider.getDarkTheme, context),
                  home: const MainScreen(),
                );
              });
        },
      ),
    );
  }
}
