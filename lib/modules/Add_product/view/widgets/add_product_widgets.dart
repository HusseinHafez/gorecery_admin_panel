import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp_admin_panel/core/components/buttons.dart';
import 'package:groceryapp_admin_panel/core/utils/app_colors.dart';
import 'package:groceryapp_admin_panel/modules/Add_product/controller/add_product_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/header.dart';
import '../../../../core/components/text_field_widget.dart';
import '../../../../core/components/text_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/utils.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils().color;
    final Size size = Utils().getScreenSize;
    return Consumer(
      builder: (context, AddProductController controller, child) => Expanded(
          flex: 5,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Header(
                    showSearch: false,
                    title: 'Add Product',
                    fct: () {
                      Scaffold.of(context).openDrawer();
                    }),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: const EdgeInsets.all(AppConstant.defaultPadding),
                  width: size.width > 650 ? 650 : size.width,
                  height: size.width > 650 ? 650 : size.height,
                
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        TextWidget(
                          text: 'Product title',
                          color: color,
                          isTitle: true,
                          textSize: 30,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        AppTextField(controller: controller.titleController,fillColor: AppColors.greyColor.withOpacity(.2),),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                child: FittedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Price in \$*',
                                        textAlign: TextAlign.start,
                                        color: color,
                                        isTitle: true,
                                        textSize: 40,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: AppTextField(
                                            controller:
                                                controller.priceController,fillColor: AppColors.greyColor.withOpacity(.2)),
                                      ),
                                      SizedBox(
                                        height: 70.h,
                                      ),
                                      TextWidget(
                                        text: 'Product Category',
                                        color: color,
                                        isTitle: true,
                                        textSize: 40,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Card(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          hint: const Text('Select Category'),
                                          value: controller.categoryValue,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.sp,
                                              color: color),
                                          onChanged:
                                              controller.onChangedDropDownMeun,
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Vegetable',
                                              child: Text(
                                                'Vegetable',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Fruits',
                                              child: Text(
                                                'Fruits',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Spices',
                                              child: Text(
                                                'Spices',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Nuts',
                                              child: Text(
                                                'Nuts',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Salad',
                                              child: Text(
                                                'Salad',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Sweet',
                                              child: Text(
                                                'Sweet',
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                      SizedBox(
                                        height: 70.h,
                                      ),
                                      TextWidget(
                                        text: 'Measure Unit',
                                        color: color,
                                        isTitle: true,
                                        textSize: 40,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                            text: 'Kg',
                                            color: color,
                                            textSize: 30,
                                            isTitle: true,
                                          ),
                                          Radio(
                                            value:
                                                controller.kgRadioButtonValue,
                                            groupValue: controller
                                                .radioButtonGroupValue,
                                            onChanged: controller
                                                .onChangedKgRadioButton,
                                          ),
                                          TextWidget(
                                            text: 'Piece',
                                            color: color,
                                            textSize: 30,
                                            isTitle: true,
                                          ),
                                          Radio(
                                            value: controller
                                                .pieceRadioButtonValue,
                                            groupValue: controller
                                                .radioButtonGroupValue,
                                            onChanged: controller
                                                .onChangedPieceRadioButton,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: controller.pickedImage != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: kIsWeb
                                                  ? Image.memory(
                                                      controller.webImage!,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.file(
                                                      controller.pickedImage!,
                                                      fit: BoxFit.fill,
                                                    ),
                                            )
                                          : DottedBorder(
                                              padding: const EdgeInsets.all(50),
                                              borderType: BorderType.RRect,
                                              dashPattern: const [6, 7],
                                              color: color,
                                              radius: const Radius.circular(12),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.image_outlined,
                                                      color: color,
                                                      size: 20.w,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TextButton(
                                                      onPressed:
                                                          controller.pickImage,
                                                      child: TextWidget(
                                                        text:
                                                            'Choose your image',
                                                        color:
                                                            AppColors.blueColor,
                                                        isTitle: true,
                                                        textSize: 30,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextButton(
                                        onPressed: controller.clearImage,
                                        child: TextWidget(
                                          text: 'Clear',
                                          color: AppColors.redColor,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: TextWidget(
                                          text: 'Update image',
                                          color: AppColors.blueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonsWidget(
                                onPressed: controller.clearForm,
                                text: 'Clear form',
                                icon: IconlyBold.danger,
                                backgroundColor: AppColors.redColor),
                            ButtonsWidget(
                                onPressed: () {},
                                text: 'Upload',
                                icon: IconlyBold.upload,
                                backgroundColor: AppColors.blueColor),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
