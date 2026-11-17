import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBuilder extends StatelessWidget {
  const SvgBuilder({
    super.key,
    required this.iconPath,
    this.color,
    this.width,
    this.height,
  });

  final String iconPath;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height: height,
      width: width,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
