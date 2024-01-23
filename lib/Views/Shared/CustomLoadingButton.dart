import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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
        width: LayoutManager(context)
            .valuesHandler(context.screenWidth, context.screenWidth, 430, 430),
        height: 46,
        controller: controller,
        color: color ?? appDesign.colorPrimary,
        successIcon: Icons.cloud,
        failedIcon: Icons.error,
        borderRadius: 10.0,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
