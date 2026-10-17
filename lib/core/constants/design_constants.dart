import 'package:flutter/material.dart';

/// Holds constant values based on Figma design specifications.
///
/// This includes design dimensions, default padding, and border radius
/// used throughout the app for consistent UI.
class FigmaConstants {
  /// The width used in Figma designs.
  static const double figmaWidth = 375.0;

  /// The height used in Figma designs.
  static const double figmaHeight = 812.0;

  /// Default horizontal padding based on Figma design.
  static const double paddingHorizontal = 20.0;
  static const double paddingHorizontal25 = 25.0;

  /// Default vertical padding based on Figma design.
  static const double paddingVertical = 25.0;

  /// Default border radius used in Figma design.
  static const double borderRadius = 16.0;

  static const double inputBorderRaduis = 11.0;

  static const double buttonBorderRaduis = double.infinity;

  static const double buttonHeight = 50;

  static const double buttonWidth = 305;

  static final shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25), // rgba(0,0,0,0.25)
      offset: Offset(0, 4), // x=0, y=4
      blurRadius: 4, // blur
      spreadRadius: 0, // same as CSS spread
    ),
  ];
}
