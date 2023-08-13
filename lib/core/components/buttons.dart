import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../../config/responsive/responsive.dart';



class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPadding * 1.5,
          vertical: AppConstant.defaultPadding / (Responsive.isDesktop() ? 1 : 2),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      icon: Icon(icon, size: 20,),
      label: Text(text),
    );
  }
}
