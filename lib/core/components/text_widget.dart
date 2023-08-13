import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    this.textSize = 26,
    this.maxLines = 10,
    this.isTitle = false, this.textAlign,
  }) : super(key: key);
  final String text;
  final Color color;
  final double textSize;
  final TextAlign? textAlign;
  bool isTitle;
  int maxLines = 10;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: textSize.sp,
          color: color,
          overflow: TextOverflow.ellipsis,
          fontWeight: isTitle ? FontWeight.w500 : FontWeight.w400),
    );
  }
}
