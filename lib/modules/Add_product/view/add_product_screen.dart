import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/components/header.dart';
import 'package:groceryapp_admin_panel/core/components/text_field_widget.dart';
import 'package:groceryapp_admin_panel/core/components/text_widget.dart';
import 'package:groceryapp_admin_panel/core/utils/constants.dart';
import 'package:groceryapp_admin_panel/core/utils/utils.dart';
import 'package:groceryapp_admin_panel/modules/Add_product/controller/add_product_controller.dart';
import 'package:groceryapp_admin_panel/modules/Add_product/view/widgets/add_product_widgets.dart';
import 'package:provider/provider.dart';

import '../../../config/responsive/responsive.dart';
import '../../../core/components/side_menu.dart';
import '../../../core/utils/service_locator.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider.value(
          value:  getIt<AddProductController>(),
        
      child: Scaffold(
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
                const AddProductWidget()
            ],
          ),
        ),
      ),
    );
  }
}