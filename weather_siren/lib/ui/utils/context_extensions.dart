import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DeviceInfoExtension on BuildContext {
  DeviceType get deviceTypeByScreen {
    if (isDesktop) {
      return DeviceType.desktop;
    }

    if (isTablet) {
      return DeviceType.tablet;
    }

    return DeviceType.mobile;
  }

  bool get isNotMobileDevice {
    return !isMobile || isDesktopPlatform;
  }
}

extension ResponsiveValuesExtension on BuildContext {
  double get dialogWidth => min(450, screenWidth * .8);
  double get responsiveSmallFontSize =>
      responsiveFontSize(fontSize: 14, max: 15);

  double get responsiveMediumFontSize =>
      responsiveFontSize(fontSize: 16, max: 17);

  double get responsiveLargeFontSize =>
      responsiveFontSize(fontSize: 21, max: 31);

  double get responsiveExtraLargeFontSize => responsiveFontSize(fontSize: 25);

  double get responsiveMassiveFontSize =>
      responsiveFontSize(fontSize: 34, max: 38);

  double responsiveFontSize({required double fontSize, double? max}) {
    // return fontSize;
    return min(
      (screenWidth / 4) * (fontSize / 100),
      max ?? fontSize,
    );
  }

  double get horizontalMargins {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth <= 600) {
      return 16.0;
    } else if (screenWidth > 600 && screenWidth < 900) {
      return 26.0;
    } else if (screenWidth > 900 && screenWidth < 1200) {
      return 34.0;
    } else if (screenWidth >= 1200) {
      return screenWidth * 0.04;
    }
    return 12.0;
  }
}

extension ContextScreenExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;

  Orientation get orientation => mediaQuery.orientation;

  bool get isPortraitMode => orientation == Orientation.portrait;

  bool get isLandscapeMode => orientation == Orientation.landscape;

  bool get isMobile => (isLandscapeMode ? screenHeight : screenWidth) < 600;

  bool get isLandscapeMobile => (isLandscapeMode && isMobile);

  bool get isLandScapeTablet =>
      isLandscapeMode && (screenHeight >= 600 && screenHeight < 980);

  bool get isPortraitTablet =>
      isPortraitMode && (screenWidth >= 600 && screenWidth < 980);

  bool get isTablet => isLandScapeTablet || isPortraitTablet;

  bool get isDesktop => screenWidth >= 980;
}

extension ContextThemeExtension on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  /// similar to [MediaQuery.of(context).theme]
  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  BorderRadius get platformBorderRadius =>
      BorderRadius.circular(isAndroidPlatform ? 20 : 8);
  Color get textFieldBorderColor => colorScheme.onBackground.withOpacity(.2);
}

extension ContextPlatformExtension on BuildContext {
  bool get isIOSPlatform => platform == TargetPlatform.iOS;

  bool get isMacOsPlatform => platform == TargetPlatform.macOS;

  bool get isDesktopPlatform {
    return platform == TargetPlatform.windows ||
        platform == TargetPlatform.macOS ||
        platform == TargetPlatform.linux;
  }

  bool get isWindowsPlatform =>
      platform == TargetPlatform.windows && Platform.isWindows;

  bool get isAndroidPlatform => platform == TargetPlatform.android;

  bool get isMobilePlatform =>
      platform == TargetPlatform.iOS || platform == TargetPlatform.android;

  TargetPlatform get platform => Theme.of(this).platform;
}

extension ContextLocaleExtension on BuildContext {
  bool get isArabicLocale => Localizations.localeOf(this).languageCode == 'ar';

  bool get isEnglishLocale => Localizations.localeOf(this).languageCode == 'en';

  bool get isRTL => isArabicLocale;

  bool get isLTR => isEnglishLocale;

  TextDirection get textDirection =>
      isLTR ? TextDirection.ltr : TextDirection.rtl;

  Locale get locale => Localizations.localeOf(this);

  AppLocalizations get localizations => AppLocalizations.of(this)!;

  String getLocaleFullName(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return localizations.arabic;
      case 'en':
        return localizations.english;
      default:
        throw UnimplementedError();
    }
  }
}

enum DeviceType { mobile, tablet, desktop }
