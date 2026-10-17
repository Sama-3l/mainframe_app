import 'package:flutter/material.dart';

class Responsive {
  static double scale(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width / 404; // 375 = your base design width
  }

  static double sp(BuildContext context, double size) => size * scale(context);
  static double w(BuildContext context, double size) => size * scale(context);
  static double h(BuildContext context, double size) => size * scale(context);
}
