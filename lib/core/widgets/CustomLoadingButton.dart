import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';


class CustomLoadingButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final Color? color;
  final String text;
  final VoidCallback onPressed;
  final bool removePadding;

  CustomLoadingButton({
    required this.controller,
    this.color,
    required this.text,
    required this.onPressed,
    this.removePadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: removePadding ? 0 : 8, vertical: 25),
      child: RoundedLoadingButton(
        width: LayoutHelper(context)
            .valuesHandler(context.screenWidth, context.screenWidth, 430, 430),
        height: 46,
        controller: controller,
        color: color ?? appDesign.colorPrimary,
        successIcon: Icons.cloud,
        failedIcon: Icons.error,
        borderRadius: 10.0,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
