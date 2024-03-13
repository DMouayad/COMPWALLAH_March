import 'package:flutter/material.dart';

final class AppThemes {
  static String get appNameFontFamily => "pierSans";
  static String get defaultFontFamily => "inter";

  static final _baseTheme = ThemeData();

  // Dark //
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    secondary: Color(0xFF78aba5),
    secondaryContainer: Color(0xFF52595c),
    onSecondaryContainer: Color(0xfff3f9f8),
    onSecondary: Color(0xFF0c1110),
    //
    primary: Color(0xFFD8C38B),
    onPrimary: Color(0xFF16130e),
    primaryContainer: Color(0xFFefe7d1),
    onPrimaryContainer: Color(0xFF413a2a),
    background: Color(0xFF3d4447),
    onBackground: Color(0xFFf2f7f6),
    surface: Color(0xFF272f33),
    onSurface: Color(0xFFe9eaeb),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    textTheme: Typography().white.apply(
          fontFamily: defaultFontFamily,
          bodyColor: darkColorScheme.onBackground,
          displayColor: darkColorScheme.secondary,
        ),
    buttonTheme: _baseTheme.buttonTheme,
  );

  // Light //
  static const ColorScheme lightColorScheme = ColorScheme.light(
    secondary: Color(0xFF78aba5),
    onSecondary: Color(0xFF1b2625),
    secondaryContainer: Color(0xFFf2f7f6),
    onSecondaryContainer: Color(0xFF182221),
    primary: Color(0xFFD8C38B),
    onPrimary: Color(0xFF2b271c),
    primaryContainer: Color(0xFFc2b07d),
    onPrimaryContainer: Color(0xFF2b271c),
    background: Color(0xFFf9f7f2),
    onBackground: Color(0xFF2b271c),
    surfaceVariant: Color(0xffdae5e2),
    surface: Color(0xFFfdfefe),
    onSurface: Color(0xFF182221),
  );

  static final lightTheme = ThemeData.light().copyWith(
    buttonTheme: _baseTheme.buttonTheme,
    colorScheme: lightColorScheme,
    textTheme: Typography().black.apply(
          fontFamily: defaultFontFamily,
          bodyColor: lightColorScheme.onBackground,
          displayColor: lightColorScheme.secondary,
        ),
  );
}
