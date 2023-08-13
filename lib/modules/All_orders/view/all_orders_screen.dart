import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/modules/All_orders/view/widgets/all_orders_widget.dart';
import 'package:groceryapp_admin_panel/modules/Allproducts/view/widgets/all_products_widget.dart';

import '../../../config/responsive/responsive.dart';
import '../../../core/components/side_menu.dart';


class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //key: context.read<AllProductsController>().getgridscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop())
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
              SizedBox(
                height: 20.h,
              ),
           const AllOrdersWidget()
          ],
        ),
      ),
    );
  }
}
