import 'package:flutter/material.dart';
import 'package:otaku_world/constants/dimensions_constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
  );
}

double getWidgetWidth({
  required double targetWidgetWidth,
  required double screenWidth,
}) {
  double widthScaleFactor =
      targetWidgetWidth / DimensionsConstants.designedScreenWidth;

  return screenWidth * widthScaleFactor;
}

double getWidgetHeight({
  required double targetWidgetHeight,
  required double screenHeight,
}) {
  double heightScaleFactor =
      targetWidgetHeight / DimensionsConstants.designedScreenHeight;

  return screenHeight * heightScaleFactor;
}
