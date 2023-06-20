import 'package:flutter/material.dart';

double widthBaseScale = 1.0;
double heightBaseScale = 1.0;
double screenWidth = 375;
double screenHeight = 812;

void initializeScalingFactors(BuildContext context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  screenWidth = mediaQueryData.size.width;
  screenHeight = mediaQueryData.size.height;

  print('Device Info:- $screenWidth X $screenHeight');

  widthBaseScale = screenWidth / 375;
  heightBaseScale = screenHeight / 812;
}

double normalize(double size, {String based = 'width'}) {
  final double newSize =
      based == 'height' ? size * heightBaseScale : size * widthBaseScale;

  return newSize;
}

double widthBased(double size) {
  return normalize(size, based: 'width');
}

double heightBased(double size) {
  return normalize(size, based: 'height');
}

double fontPixel(double size) {
  return heightBased(size);
}

double pixelSizeVertical(double size) {
  return heightBased(size);
}

double pixelSizeHorizontal(double size) {
  return widthBased(size);
}
