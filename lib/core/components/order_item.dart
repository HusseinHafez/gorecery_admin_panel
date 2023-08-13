import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/components/text_widget.dart';
import 'package:groceryapp_admin_panel/core/utils/app_colors.dart';

import '../utils/utils.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Utils().color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png',
                fit: BoxFit.fill,
                scale: 4,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(
                      text: '12x For \$19.9',
                      color: color,
                      isTitle: true,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        TextWidget(text: 'By', color: AppColors.blueColor, isTitle: true,),
                        SizedBox(
                          width: 6.w,
                        ),
                        TextWidget(text: 'Hadi k', color: color, isTitle: true,),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
                      '23/6/2023',
                      style: TextStyle(
                        color: AppColors.greyColor
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
