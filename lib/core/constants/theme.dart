// ignore_for_file: unused_element

import 'package:flutter/material.dart';

abstract class Fonts {
  static String get bonoNova => 'BonaNova-Regular';
  static String get bonoNovaItalic => 'BonaNova-Italic';
  static String get bonoNovaBold => 'BonaNova-Bold';

  static String get geistThin => 'Geist-Thin';
  static String get geistExtraLight => 'Geist-ExtraLight';
  static String get geistLight => 'Geist-Light';
  static String get geist => 'Geist';
  static String get geistMedium => 'Geist-Medium';
  static String get geistSemiBold => 'Geist-SemiBold';
  static String get geistBold => 'Geist-Bold';
  static String get geistExtraBold => 'Geist-ExtraBold';
  static String get geistBlack => 'Geist-Black';

  static String get geistThinItalic => 'Geist-ThinItalic';
  static String get geistExtraLightItalic => 'Geist-ExtraLightItalic';
  static String get geistLightItalic => 'Geist-LightItalic';
  static String get geistItalic => 'Geist-Italic';
  static String get geistMediumItalic => 'Geist-MediumItalic';
  static String get geistSemiBoldItalic => 'Geist-SemiBoldItalic';
  static String get geistBoldItalic => 'Geist-BoldItalic';
  static String get geistExtraBoldItalic => 'Geist-ExtraBoldItalic';
  static String get geistBlackItalic => 'Geist-BlackItalic';
}

abstract class ColorsConstants {
  // APP COLORS
  static bool isDarkMode = false;

  static Color get _greenChannelPrimary => const Color(0xff16DB65);

  static Color get _greenChannel100 => const Color(0xff058C42);

  static Color get _greenChannel200 => const Color(0xff04471C);

  static Color get _greenChannel300 => const Color(0xff0D2818);

  static Color get _redChannelPrimary => const Color(0xffFF1744);

  static Color get _redChannel100 => const Color(0xffC90032);

  static Color get _redChannel200 => const Color(0xff8C0026);

  static Color get _redChannel300 => const Color(0xff380014);

  static Color get _blueChannelPrimary => const Color(0xff00A3FF);

  static Color get _blueChannel100 => const Color(0xff0866E8);

  static Color get _blueChannel200 => const Color(0xff0645A8);

  static Color get _blueChannel300 => const Color(0xff0A2045);

  static Color get _yellowPlatePrimary => const Color(0xffFFD600);

  static Color get _yellowPlate100 => const Color(0xffE6B800);

  static Color get _yellowPlate200 => const Color(0xff997A00);

  static Color get _yellowPlate300 => const Color(0xff332900);

  static Color get _magentaPlatePrimary => const Color(0xffFF1F94);

  static Color get _magentaPlate100 => const Color(0xffCC006B);

  static Color get _magentaPlate200 => const Color(0xff7A0040);

  static Color get _magentaPlate300 => const Color(0xff290015);

  static Color get _paperWhitePrimary => const Color(0xff020202);

  static Color get _paperWhite100 => const Color(0xff9A968C);

  static Color get _paperWhite200 => const Color(0xff67655E);

  static Color get _inkBlackPrimary => const Color(0xff020202);

  //DELETE

  static Color get _backgroundLight => const Color(0xffF0EDEE);

  static Color get _backgroundDark => const Color(0xff020202);

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
  static TextStyle get _geistExtraBold =>
      TextStyle(fontFamily: Fonts.geistExtraBold, fontWeight: FontWeight.w800);
  static TextStyle get _geistExtraBoldItalic => TextStyle(
    fontFamily: Fonts.geistExtraBoldItalic,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get _geistBold =>
      TextStyle(fontFamily: Fonts.geistBold, fontWeight: FontWeight.w700);
  static TextStyle get _geistBoldItalic =>
      TextStyle(fontFamily: Fonts.geistBoldItalic, fontWeight: FontWeight.w700);
  static TextStyle get _geistSemiBold =>
      TextStyle(fontFamily: Fonts.geistSemiBold, fontWeight: FontWeight.w600);
  static TextStyle get _geistSemiBoldItalic => TextStyle(
    fontFamily: Fonts.geistSemiBoldItalic,
    fontWeight: FontWeight.w600,
  );
  static TextStyle get _geistMedium =>
      TextStyle(fontFamily: Fonts.geistMedium, fontWeight: FontWeight.w500);
  static TextStyle get _geistMediumItalic => TextStyle(
    fontFamily: Fonts.geistMediumItalic,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get _geist =>
      TextStyle(fontFamily: Fonts.geist, fontWeight: FontWeight.w400);
  static TextStyle get _geistItalic =>
      TextStyle(fontFamily: Fonts.geistItalic, fontWeight: FontWeight.w400);
  static TextStyle get _geistLight =>
      TextStyle(fontFamily: Fonts.geistLight, fontWeight: FontWeight.w300);
  static TextStyle get _geistLightItalic => TextStyle(
    fontFamily: Fonts.geistLightItalic,
    fontWeight: FontWeight.w300,
  );
  static TextStyle get _geistExtraLight =>
      TextStyle(fontFamily: Fonts.geistLight, fontWeight: FontWeight.w300);
  static TextStyle get _geistExtraLightItalic => TextStyle(
    fontFamily: Fonts.geistLightItalic,
    fontWeight: FontWeight.w300,
  );

  //Clash Display fonts
  static TextStyle get _bonoNova =>
      TextStyle(fontFamily: Fonts.bonoNova, fontWeight: FontWeight.w400);
  static TextStyle get _bonoNovaItalic =>
      TextStyle(fontFamily: Fonts.bonoNovaItalic, fontWeight: FontWeight.w400);
  static TextStyle get _bonoNovaBold =>
      TextStyle(fontFamily: Fonts.bonoNovaBold, fontWeight: FontWeight.w400);

  /// 40px, -5%, BonoNova
  static TextStyle get titleLarge => _bonoNova.copyWith(
    letterSpacing: -2,
    fontSize: 40,
    color: ColorsConstants.onBackground,
  );

  /// 24px, -5%, BonoNova
  static TextStyle get titleMedium => _bonoNova.copyWith(
    letterSpacing: -1.2,
    fontSize: 24,
    color: ColorsConstants.onBackground,
  );

  /// 16px, -5%, BonoNova
  static TextStyle get titleSmall => _bonoNova.copyWith(
    letterSpacing: -0.8,
    fontSize: 16,
    color: ColorsConstants.onBackground,
  );

  /// 12px, 8px, -5%, BonoNova
  static TextStyle get captionLarge => _bonoNova.copyWith(
    letterSpacing: -0.6,
    fontSize: 12,
    height: 8,
    color: ColorsConstants.onBackground,
  );

  /// 12px, 8px, -10%, BonoNova
  static TextStyle get captionCompressed => _bonoNova.copyWith(
    letterSpacing: -1.2,
    fontSize: 12,
    height: 8,
    color: ColorsConstants.onBackground,
  );

  /// 8px, 8px, -10%, BonoNova
  static TextStyle get captionSmall => _bonoNova.copyWith(
    letterSpacing: -0.8,
    fontSize: 8,
    height: 8,
    color: ColorsConstants.onBackground,
  );

  /// 24px, -5%, Regular, Geist
  static TextStyle get subtitle => _geist.copyWith(
    letterSpacing: -1.2,
    fontSize: 24,
    color: ColorsConstants.onBackground,
  );

  /// 16px, -5%, Regular, Geist
  static TextStyle get button => _geist.copyWith(
    letterSpacing: -0.8,
    fontSize: 16,
    color: ColorsConstants.onBackground,
  );

  /// 16px, -5%, Semi-Bold, Geist
  static TextStyle get buttonBold => _geistSemiBold.copyWith(
    letterSpacing: -0.8,
    fontSize: 16,
    color: ColorsConstants.onBackground,
  );

  /// 12px, -5%, Medium, Geist
  static TextStyle get bodyMedium => _geistMedium.copyWith(
    letterSpacing: -0.6,
    fontSize: 12,
    color: ColorsConstants.onBackground,
  );

  /// 12px, -5%, Regular, Geist
  static TextStyle get body => _geist.copyWith(
    letterSpacing: -0.6,
    fontSize: 12,
    color: ColorsConstants.onBackground,
  );

  /// 12px, -2.5%, Regular, Geist
  static TextStyle get bodySmall => _geist.copyWith(
    letterSpacing: -0.25,
    fontSize: 10,
    color: ColorsConstants.onBackground,
  );

  /// 10px, 10px, -2.5%, Semi-Bold, Geist
  static TextStyle get labelMedium => _geistMedium.copyWith(
    letterSpacing: -0.25,
    fontSize: 10,
    height: 10,
    color: ColorsConstants.onBackground,
  );

  /// 10px, 10px, -2.5%, Semi-Bold, Geist
  static TextStyle get labelSmall => _geistSemiBold.copyWith(
    letterSpacing: -0.3,
    fontSize: 6,
    color: ColorsConstants.onBackground,
  );
}
