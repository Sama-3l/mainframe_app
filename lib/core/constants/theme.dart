// ignore_for_file: unused_element

import 'package:flutter/material.dart';

abstract class Fonts {
  static String get clashDisplaySemiBold => 'ClashDisplay-SemiBold';
  static String get clashDisplay => 'ClashDisplay-Regular';
  static String get clashDisplayMedium => 'ClashDisplay-Medium';
  static String get clashDisplayBold => 'ClashDisplay-Bold';
  static String get clashDisplayLight => 'ClashDisplay-Light';
  static String get clashDisplayExtraLight => 'ClashDisplay-ExtraLight';

  static String get fustatExtraBold => 'Fustat-ExtraBold';
  static String get fustatBold => 'Fustat-Bold';
  static String get fustatSemiBold => 'Fustat-SemiBold';
  static String get fustatMedium => 'Fustat-Medium';
  static String get fustat => 'Fustat';
  static String get fustatLight => 'Fustat-Light';
  static String get fustatExtraLight => 'Fustat-ExtraLight';
}

abstract class ColorsConstants {
  // APP COLORS
  static bool isDarkMode = false;

  static Color get _backgroundLight => const Color(0xffFAFAFF);

  static Color get _backgroundDark => const Color(0xff161719);

  static Color get _primaryColor => const Color(0xff2C26B5);

  static Color get _primaryDarkerColor => const Color(0xff222427);

  static Color get _secondaryColor => const Color(0xffEAE9F8);

  static Color get _secondaryDarkerColor => const Color(0xffE5E5EA);

  static Color get _backgroundLightOpacityPoint2Color =>
      _backgroundLight.withValues(alpha: 0.2);
  static Color get _backgroundDarkOpacityPoint2Color =>
      _backgroundDark.withValues(alpha: 0.2);
  static Color get light => _backgroundLight;
  static Color get dark => _backgroundDark;

  // DYNAMIC COLORS
  static Color get background =>
      !isDarkMode ? _backgroundLight : _backgroundDark;
  static Color get onBackground =>
      !isDarkMode ? _backgroundDark : _backgroundLight;
  static Color get primary => !isDarkMode ? _primaryColor : _secondaryColor;
  static Color get primaryDarker =>
      !isDarkMode ? _primaryDarkerColor : _secondaryDarkerColor;
  static Color get secondary => !isDarkMode ? _secondaryColor : _primaryColor;
  static Color get secondaryDarker =>
      !isDarkMode ? _secondaryDarkerColor : _primaryDarkerColor;
  static Color get backgroundOpacityPoint2 => !isDarkMode
      ? _backgroundDarkOpacityPoint2Color
      : _backgroundLightOpacityPoint2Color;

  static Color get alternate => const Color(0xff8A8B8C);
  static Color get destructiveRed => const Color(0xffFF3B30);
  static Color get systemYellow => const Color(0xffFFCC00);
  static Color get green => const Color(0xff34C759);
}

class TextStyles {
  //Fustat fonts
  static TextStyle get _fustatExtraBold =>
      TextStyle(fontFamily: Fonts.fustatExtraBold, fontWeight: FontWeight.w800);
  static TextStyle get _fustatBold =>
      TextStyle(fontFamily: Fonts.fustatBold, fontWeight: FontWeight.w700);
  static TextStyle get _fustatSemiBold =>
      TextStyle(fontFamily: Fonts.fustatSemiBold, fontWeight: FontWeight.w600);
  static TextStyle get _fustatMedium =>
      TextStyle(fontFamily: Fonts.fustatMedium, fontWeight: FontWeight.w500);
  static TextStyle get _fustat =>
      TextStyle(fontFamily: Fonts.fustat, fontWeight: FontWeight.w400);
  static TextStyle get _fustatLight =>
      TextStyle(fontFamily: Fonts.fustatLight, fontWeight: FontWeight.w300);
  static TextStyle get _fustatExtraLight =>
      TextStyle(fontFamily: Fonts.fustatLight, fontWeight: FontWeight.w300);

  //Clash Display fonts
  static TextStyle get _clashDisplayBold => TextStyle(
    fontFamily: Fonts.clashDisplayBold,
    fontWeight: FontWeight.w700,
  );
  static TextStyle get _clashDisplaySemiBold => TextStyle(
    fontFamily: Fonts.clashDisplaySemiBold,
    fontWeight: FontWeight.w600,
  );
  static TextStyle get _clashDisplayMedium => TextStyle(
    fontFamily: Fonts.clashDisplayMedium,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get _clashDisplay =>
      TextStyle(fontFamily: Fonts.clashDisplay, fontWeight: FontWeight.w400);
  static TextStyle get _clashDisplayLight => TextStyle(
    fontFamily: Fonts.clashDisplayLight,
    fontWeight: FontWeight.w300,
  );
  static TextStyle get _clashDisplayExtraLight => TextStyle(
    fontFamily: Fonts.clashDisplayLight,
    fontWeight: FontWeight.w300,
  );

  //App font styles
  /// 24px, -0.6, Medium
  static TextStyle get heading => _clashDisplayMedium.copyWith(
    letterSpacing: -0.6,
    fontSize: 24,
    color: ColorsConstants.onBackground,
  );

  /// 16px, -0.4, ExtraBold
  static TextStyle get titleMedium => _fustatExtraBold.copyWith(
    letterSpacing: -0.4,
    fontSize: 16,
    color: ColorsConstants.onBackground,
  );

  /// 12px, -0.3, ExtraBold
  static TextStyle get titleSmall => _fustatExtraBold.copyWith(
    letterSpacing: -0.3,
    fontSize: 12,
    color: ColorsConstants.onBackground,
  );

  /// 12px, Medium
  static TextStyle get bodyMedium => _fustat.copyWith(
    fontSize: 12,
    color: ColorsConstants.onBackground,
    letterSpacing: -0.3,
  );

  /// 16px, -0.1, Regular
  static TextStyle get bodyLarge => _fustat.copyWith(
    fontSize: 16,
    color: ColorsConstants.onBackground,
    letterSpacing: -0.1,
  );

  /// 10px, Regular
  static TextStyle get bodySmall =>
      _fustat.copyWith(fontSize: 10, color: ColorsConstants.onBackground);

  /// 12px, -0.1, Semi-Bold, Clash
  static TextStyle get labelLargeBold => _clashDisplaySemiBold.copyWith(
    fontSize: 12,
    color: ColorsConstants.onBackground,
  );

  /// 12px, Regular, Clash
  static TextStyle get labelLarge =>
      _clashDisplay.copyWith(fontSize: 12, color: ColorsConstants.onBackground);

  /// 10px, -0.5, Bold
  static TextStyle get labelMedium => _fustatBold.copyWith(
    fontSize: 10,
    letterSpacing: -0.5,
    color: ColorsConstants.onBackground,
  );

  /// 8px, Semi-Bold, Clash
  static TextStyle get labelSmall => _clashDisplaySemiBold.copyWith(
    fontSize: 8,
    color: ColorsConstants.onBackground,
  );

  /// 8px, -0.4, Bold
  static TextStyle get caption => _fustatBold.copyWith(
    fontSize: 8,
    letterSpacing: -0.4,
    color: ColorsConstants.onBackground,
  );
}
