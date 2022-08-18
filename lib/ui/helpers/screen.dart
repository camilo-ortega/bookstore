import 'package:flutter/material.dart';
import 'dart:math' as math;

class Screen {
  static Screen initialize(BuildContext context) => Screen(context);

  Screen(BuildContext context) {
    _size = MediaQuery.of(context).size;
  }

  static late Size _size;

  static double get getWidthSize => _size.width;
  static double get getHeightSize => _size.height;
  static double get getDiagonalSize =>
      math.sqrt(math.pow(getWidthSize, 2) + math.pow(getHeightSize, 2));
  static bool get isTablet => _size.shortestSide >= 600;

  static double getWidthInPercent(double value) => (value * getWidthSize) / 100;
  static double getHeightInPercent(double value) =>
      (value * getHeightSize) / 100;
  static double getDiagonalInPercent(double value) =>
      (value * getDiagonalSize) / 100;
}
