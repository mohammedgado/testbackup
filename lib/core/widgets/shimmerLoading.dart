import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final double? height;
  final double? width;
  bool rounded ;


  ShimmerLoader({Key? key,this.height,this.width,this.rounded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: rounded ? BorderRadius.circular(10) : null,
          color: Colors.grey.shade200,
        ),
        height: height ?? context.screenHeight,
        width: width ?? context.screenWidth,

      ) ,
    );
  }
}
