import 'package:flutter/material.dart';

import '../../../../core/components/order_item.dart';
import '../../../../core/utils/constants.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: const EdgeInsets.all(AppConstant.defaultPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color:Theme.of(context).cardColor,
                        ),
                        child: ListView.separated(
                         // padding: EdgeInsets.all(AppConstant.defaultPadding),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>const OrderItem() ,
                           separatorBuilder:(context, index) => const Divider(thickness: 3,),
                            itemCount: 10,),
                      );
  }
}