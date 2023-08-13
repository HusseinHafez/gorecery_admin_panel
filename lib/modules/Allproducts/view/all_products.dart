import 'package:flutter/material.dart';
import 'package:groceryapp_admin_panel/modules/Allproducts/view/widgets/all_products_widget.dart';

import '../../../config/responsive/responsive.dart';
import '../../../core/components/side_menu.dart';


class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
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
           const AllProductsWidget()
          ],
        ),
      ),
    );
  }
}
