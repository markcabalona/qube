import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeMode get themeMode => Theme.of(this).brightness == Brightness.light
      ? ThemeMode.light
      : ThemeMode.dark;
}
