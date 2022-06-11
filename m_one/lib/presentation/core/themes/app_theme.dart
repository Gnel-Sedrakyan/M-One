import 'package:m_one/presentation/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      headline1: base.headline1?.copyWith(fontFamily: fontName),
      headline2: base.headline2?.copyWith(fontFamily: fontName),
      headline3: base.headline3?.copyWith(fontFamily: fontName),
      headline4: base.headline4?.copyWith(fontFamily: fontName),
      headline5: base.headline5?.copyWith(fontFamily: fontName),
      headline6: base.headline6?.copyWith(fontFamily: fontName),
      button: base.button?.copyWith(fontFamily: fontName),
      caption: base.caption?.copyWith(fontFamily: fontName),
      bodyText1: base.bodyText1
          ?.copyWith(fontFamily: fontName, fontWeight: FontWeight.w700),
      bodyText2: base.bodyText2?.copyWith(fontFamily: fontName),
      subtitle1: base.subtitle1?.copyWith(fontFamily: fontName),
      subtitle2: base.subtitle2?.copyWith(fontFamily: fontName),
      overline: base.overline?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColorLight,
      secondary: secondaryColorLightTheme,
      surface: surfaceColorLightTheme,
      onSurface: Colors.black,
      onPrimary: Colors.white,
    );

    final ThemeData baseThemeData = ThemeData.light();
    return baseThemeData.copyWith(
      shadowColor: defaultShadowColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: headerBackgroundColorLightTheme,
          foregroundColor:
              headerForegroundColorLightTheme //here you can give the text color
          ),
      colorScheme: colorScheme,
      primaryColor: primaryColorLight,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            side: BorderSide(color: Colors.red)),
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(baseThemeData.textTheme),
      primaryTextTheme: _buildTextTheme(baseThemeData.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
  }

  static ThemeData buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColorDark,
      secondary: secondaryColorDarkTheme,
      surface: surfaceColorDarkTheme,
      onSurface: Colors.white,
      onPrimary: Colors.white,
    );

    final ThemeData baseThemeData = ThemeData.dark();
    return baseThemeData.copyWith(
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
          backgroundColor: headerBackgroundColorDarkTheme,
          foregroundColor:
              headerForegroundColorDarkTheme //here you can give the text color
          ),
      primaryColor: primaryColorDark,
      indicatorColor: bgColorDarkTheme,
      splashColor: bgColorDarkTheme,
      splashFactory: InkRipple.splashFactory,
      canvasColor: bgColorDarkTheme,
      backgroundColor: bgColorDarkTheme,
      scaffoldBackgroundColor: bgColorDarkTheme,
      errorColor: const Color(0xFFB00020),
      // buttonTheme: ButtonThemeData(
      //   colorScheme: colorScheme,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      textTheme: _buildTextTheme(ThemeData.dark().textTheme),
      primaryTextTheme: _buildTextTheme(ThemeData.dark().textTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
