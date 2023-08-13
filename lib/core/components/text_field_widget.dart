import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp_admin_panel/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Key? textFieldKey;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool filled;
  final Color fillColor;
  final double borderRaduis;

  const AppTextField(
      {super.key,
      required this.controller,
      this.validator,
       this.textFieldKey,
       this.obscureText=false,
       this.textInputAction,
       this.keyboardType,
      this.inputFormatters,
      this.onChanged,
       this.filled=true,
       this.fillColor=AppColors.whiteColor,
       this.borderRaduis=8,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      key: textFieldKey,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide.none),
      ),
    );
  }
}
