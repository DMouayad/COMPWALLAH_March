import 'package:flutter/material.dart';

extension ColorSchemeHelpers on ColorScheme {
  Color get onBackgroundLighter => onBackground.withOpacity(.76);
  Color get cardColor => surfaceVariant;
  Color get onCard => onPrimary;
}
