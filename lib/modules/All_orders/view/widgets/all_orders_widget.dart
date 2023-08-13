import 'package:flutter/material.dart';

import '../../../../core/components/header.dart';
import '../../../../core/components/order_item.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/utils.dart';

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize;
    return Expanded(
        // It takes 5/6 part of the screen
        flex: 5,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Header(
                title: 'All Orders',
                fct: () {
                  Scaffold.of(context).openDrawer();
                  /*  context
                              .read<AllProductsController>()
                              .controlProductsMenu(); */
                },
              ),
              ListView.separated(
                 padding: const EdgeInsets.all(AppConstant.defaultPadding),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const OrderItem(),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 3,
                ),
                itemCount: 30,
              ),
            ],
          ),
        ));
  }
}
