import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
class LayoutHelper {
  final _smallPhones = 550;
  final _regularPhones = 1080;
// final _tablet = 1024;
  final BuildContext context;

  LayoutHelper(this.context);
  double valuesHandler(
      double regular, double small, double tablet, double landScape) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landScape;
    }
    if (context.screenHeight > _regularPhones) {
      return tablet;
    }
    if (context.screenHeight <= _regularPhones &&
        context.screenHeight > _smallPhones) {
      return regular;
    }
    if (context.screenHeight <= _smallPhones) {
      return small;
    }

    return regular;
  }

  double mainHorizontalPadding() {
    return valuesHandler(16, 8, 70, 70);
  }
}
