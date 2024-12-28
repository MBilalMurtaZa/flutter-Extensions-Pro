import 'package:flutter/material.dart';

extension MediaQueryUtils on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  /// Checks if the current theme is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Checks if the current theme is in light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
