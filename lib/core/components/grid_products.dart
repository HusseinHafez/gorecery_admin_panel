import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'products_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio,
    this.isInMain = true,
     this.mainAxisExtent,
  }) : super(key: key);
  final int crossAxisCount;
  final double? childAspectRatio;
  final double? mainAxisExtent;
  final bool isInMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isInMain ? 4 : 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          //childAspectRatio: childAspectRatio!,
          mainAxisExtent: mainAxisExtent,
          crossAxisSpacing: AppConstant.defaultPadding,
          mainAxisSpacing: AppConstant.defaultPadding,
        ),
        itemBuilder: (context, index) {
          return const ProductWidget();
        });
  }
}
