// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:mainframe_app/core/constants/enums.dart';

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

  static PrimaryTheme theme = PrimaryTheme.greenChannel;

  static Color calculateColor(ColorType colorType) {
    switch (colorType) {
      case ColorType.primary:
        switch (theme) {
          case PrimaryTheme.greenChannel:
            return greenChannelPrimary;
          case PrimaryTheme.redChannel:
            return redChannelPrimary;
          case PrimaryTheme.blueChannel:
            return blueChannelPrimary;
          case PrimaryTheme.magentaPlate:
            return magentaPlatePrimary;
          case PrimaryTheme.yellowPlate:
            return yellowPlatePrimary;
        }
      case ColorType.secondary:
        switch (theme) {
          case PrimaryTheme.greenChannel:
            return greenChannel100;
          case PrimaryTheme.redChannel:
            return redChannel100;
          case PrimaryTheme.blueChannel:
            return blueChannel100;
          case PrimaryTheme.magentaPlate:
            return magentaPlate100;
          case PrimaryTheme.yellowPlate:
            return yellowPlate100;
        }
      case ColorType.tertiary:
        switch (theme) {
          case PrimaryTheme.greenChannel:
            return greenChannel200;
          case PrimaryTheme.redChannel:
            return redChannel200;
          case PrimaryTheme.blueChannel:
            return blueChannel200;
          case PrimaryTheme.magentaPlate:
            return magentaPlate200;
          case PrimaryTheme.yellowPlate:
            return yellowPlate200;
        }
      case ColorType.quaternary:
        switch (theme) {
          case PrimaryTheme.greenChannel:
            return greenChannel300;
          case PrimaryTheme.redChannel:
            return redChannel300;
          case PrimaryTheme.blueChannel:
            return blueChannel300;
          case PrimaryTheme.magentaPlate:
            return magentaPlate300;
          case PrimaryTheme.yellowPlate:
            return yellowPlate300;
        }
    }
  }

  static Color get greenChannelPrimary => const Color(0xff16DB65);

  static Color get greenChannel100 => const Color(0xff058C42);

  static Color get greenChannel200 => const Color(0xff04471C);

  static Color get greenChannel300 => const Color(0xff0D2818);

  static Color get redChannelPrimary => const Color(0xffFF1744);

  static Color get redChannel100 => const Color(0xffC90032);

  static Color get redChannel200 => const Color(0xff8C0026);

  static Color get redChannel300 => const Color(0xff380014);

  static Color get blueChannelPrimary => const Color(0xff00A3FF);

  static Color get blueChannel100 => const Color(0xff0866E8);

  static Color get blueChannel200 => const Color(0xff0645A8);

  static Color get blueChannel300 => const Color(0xff0A2045);

  static Color get yellowPlatePrimary => const Color(0xffFFD600);

  static Color get yellowPlate100 => const Color(0xffE6B800);

  static Color get yellowPlate200 => const Color(0xff997A00);

  static Color get yellowPlate300 => const Color(0xff332900);

  static Color get magentaPlatePrimary => const Color(0xffFF1F94);

  static Color get magentaPlate100 => const Color(0xffCC006B);

  static Color get magentaPlate200 => const Color(0xff7A0040);

  static Color get magentaPlate300 => const Color(0xff290015);

  static Color get paperWhite => const Color(0xffF0EDEE);

  static Color get paperWhite100 => const Color(0xff9A968C);

  static Color get paperWhite200 => const Color(0xff67655E);

  static Color get inkBlack => const Color(0xff020202);

  // SYSTEM COLORS
  static Color get destructiveRed => const Color(0xffFF3B30);

  static Color get systemYellow => const Color(0xffFFCC00);

  static Color get green => const Color(0xff34C759);

  // THEME COLORS
  static Color get primary => calculateColor(ColorType.primary);

  static Color get secondary => calculateColor(ColorType.secondary);

  static Color get tertiary => calculateColor(ColorType.tertiary);

  static Color get quaternary => calculateColor(ColorType.quaternary);

  // DYNAMIC COLORS
  static Color get background => inkBlack;
  static Color get onBackground => paperWhite;
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
