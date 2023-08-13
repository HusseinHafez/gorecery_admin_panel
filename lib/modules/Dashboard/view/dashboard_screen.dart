import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/components/buttons.dart';
import 'package:groceryapp_admin_panel/core/components/order_item.dart';
import 'package:groceryapp_admin_panel/core/components/text_widget.dart';
import 'package:groceryapp_admin_panel/core/utils/app_colors.dart';

import '../../../config/responsive/responsive.dart';
import '../../../core/components/grid_products.dart';
import '../../../core/components/header.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../add_product/view/add_product_screen.dart';
import 'widgets/orders_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstant.defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
              fct: () {
                Scaffold.of(context).openDrawer();
                // context.read<MainController>().controlDashboarkMenu();
              },
            ),
            SizedBox(height: 10.h),
            TextWidget(
              text: 'Latest Products',
              color: AppColors.greyColor,
              isTitle: true,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonsWidget(
                    onPressed: () {},
                    text: 'View All',
                    icon: Icons.store,
                    backgroundColor: AppColors.blueColor),
                ButtonsWidget(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProductScreen(),
                        ),
                      );
                    },
                    text: 'Add Product',
                    icon: Icons.add_box_rounded,
                    backgroundColor: AppColors.blueColor),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          mainAxisExtent: size.width < 650 && size.width > 350
                              ? size.height * .25
                              : size.height * .3,
                        ),
                        desktop: ProductGridWidget(
                          mainAxisExtent: size.width < 1400
                              ? size.height * .3
                              : size.height * .3,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const OrdersList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
