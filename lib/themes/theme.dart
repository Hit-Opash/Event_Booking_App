import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,

      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     _lightFillColor.withOpacity(0.80),
      //     _darkFillColor,
      //   ),
      //   contentTextStyle: textTheme.titleMedium!.apply(color: _darkFillColor),
      // ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0XFF5669FF),
    onPrimaryContainer: Color(0XFFFFFFFF),
    secondary: Color(0xFFEEEEEF),
    onSecondaryContainer: Color(0XFF484646),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF5669FF),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Color(0XFF120D26),
    onSecondary: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
        fontWeight: _medium,
        fontSize: fontPixel(FontSizes.F_35),
        color: const Color(0XFF120D26)),
    headlineMedium: TextStyle(
        fontWeight: _medium,
        fontSize: fontPixel(FontSizes.F_24),
        color: const Color(0XFF120D26)),
    bodyLarge: TextStyle(
        fontWeight: _medium,
        fontSize: fontPixel(FontSizes.F_22),
        color: const Color(0XFF120D26)),
    bodyMedium: TextStyle(
        fontWeight: _medium,
        fontSize: fontPixel(FontSizes.F_20),
        color: const Color(0XFF120D26)),
    bodySmall: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_18),
        color: const Color(0XFF120D26)),
    labelLarge: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_16),
        color: const Color(0XFF120D26)),
    labelMedium: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_15),
        color: const Color(0XFF120D26)),
    titleLarge: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_14),
        color: const Color(0XFF120D26)),
    titleMedium: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_13),
        color: const Color(0XFF120D26)),
    titleSmall: TextStyle(
        fontWeight: _regular,
        fontSize: fontPixel(FontSizes.F_12),
        color: const Color(0XFF120D26)),
  );

  static ColorScheme customColorSchema() {
    return const ColorScheme(
      primary: Color(0XFF5669FF),
      onPrimaryContainer: Color(0XFFFFFFFF),
      secondary: Color(0xFFEEEEEF),
      onSecondaryContainer: Color(0XFF484646),
      background: Color(0xFFE6EBEB),
      surface: Color(0xFFFAFBFB),
      onSurface: Color(0xFF5669FF),
      onBackground: Colors.white,
      error: _lightFillColor,
      onError: _lightFillColor,
      onPrimary: Color(0XFF120D26),
      onSecondary: Color(0xFFFFFFFF),
      brightness: Brightness.light,
    );
  }
}
