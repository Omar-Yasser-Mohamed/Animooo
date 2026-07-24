import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;
  double get topPadding => MediaQuery.of(this).viewPadding.top;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}