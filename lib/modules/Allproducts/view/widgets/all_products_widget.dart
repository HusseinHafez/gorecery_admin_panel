import 'package:flutter/material.dart';

import '../../../../config/responsive/responsive.dart';
import '../../../../core/components/grid_products.dart';
import '../../../../core/components/header.dart';
import '../../../../core/utils/utils.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = Utils().getScreenSize;
    return  Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Header(
                        title: 'All Products',
                        fct: () {
                          Scaffold.of(context).openDrawer();
                         /*  context
                              .read<AllProductsController>()
                              .controlProductsMenu(); */
                        },
                      ),
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          mainAxisExtent: size.width < 650 && size.width > 350
                              ? size.height * .25
                              : size.height * .3,
                          isInMain: false,
                        ),
                        desktop: ProductGridWidget(
                            mainAxisExtent: size.width < 1400
                              ? size.height * .3
                              : size.height * .3,
                          isInMain: false,
                        ),
                      ),
                    ],
                  ),
                ));
  }
}