import "package:flutter/material.dart";

class QubeTheme {
  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff50BA84),
    surfaceTint: Color(0xff91d5ac),
    onPrimary: Color(0xff003921),
    primaryContainer: Color(0xff045232),
    onPrimaryContainer: Color(0xffadf2c7),
    secondary: Color(0xff33B3AA),
    onSecondary: Color(0xff003734),
    secondaryContainer: Color(0xff00504b),
    onSecondaryContainer: Color(0xff9df2e9),
    tertiary: Color(0xff15ABD0),
    onTertiary: Color(0xff003543),
    tertiaryContainer: Color(0xff004e60),
    onTertiaryContainer: Color(0xffb6eaff),
    error: Color(0xffFF5555),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff0f1511),
    onSurface: Color(0xffdfe4dd),
    onSurfaceVariant: Color(0xffc0c9c0),
    outline: Color(0xff8a938b),
    outlineVariant: Color(0xff404942),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdfe4dd),
    inversePrimary: Color(0xff276a49),
    primaryFixed: Color(0xffadf2c7),
    onPrimaryFixed: Color(0xff002111),
    primaryFixedDim: Color(0xff91d5ac),
    onPrimaryFixedVariant: Color(0xff045232),
    secondaryFixed: Color(0xff9df2e9),
    onSecondaryFixed: Color(0xff00201e),
    secondaryFixedDim: Color(0xff81d5cd),
    onSecondaryFixedVariant: Color(0xff00504b),
    tertiaryFixed: Color(0xffb6eaff),
    onTertiaryFixed: Color(0xff001f28),
    tertiaryFixedDim: Color(0xff88d1eb),
    onTertiaryFixedVariant: Color(0xff004e60),
    surfaceDim: Color(0xff0f1511),
    surfaceBright: Color(0xff353b36),
    surfaceContainerLowest: Color(0xff0a0f0c),
    surfaceContainerLow: Color(0xff171d19),
    surfaceContainer: Color(0xff1b211d),
    surfaceContainerHigh: Color(0xff262b27),
    surfaceContainerHighest: Color(0xff303632),
  );

  ThemeData dark() {
    return theme(darkScheme);
  }

  static LinearGradient mainLinearGradient([ThemeMode? themeMode]) {
    return LinearGradient(
      colors: switch (themeMode) {
        ThemeMode.light => throw UnimplementedError(),
        (_) => [
            darkScheme.primary,
            darkScheme.secondary,
            darkScheme.tertiary,
          ]
      },
    );
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}
