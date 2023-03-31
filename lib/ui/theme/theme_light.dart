import 'package:flutter/material.dart';

class LightColor {
  static const Color backColor = Colors.white;
  static const Color mainColor = Colors.yellow;
  static const Color mainLightColor = Color(0xFFFFF493);
  static const Color textColor = Colors.black;
  static const Color error = Color(0xFFE95255);
}

ThemeData _themeLight = ThemeData.light();

final appThemeLight = _themeLight.copyWith(
  colorScheme: _schemeLight(_themeLight.colorScheme),
  listTileTheme: _listTileLight(_themeLight.listTileTheme),
  textTheme: _textLight(_themeLight.textTheme),
  floatingActionButtonTheme:
      _floatButtonLight(_themeLight.floatingActionButtonTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    error: LightColor.error,
    primary: LightColor.mainColor,
    onPrimary: LightColor.textColor,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    displayLarge: base.displayLarge!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: LightColor.textColor,
    ),
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: LightColor.textColor,
    ),
    headlineLarge: base.headlineLarge!.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: LightColor.textColor,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: LightColor.textColor,
    ),
  );
}

FloatingActionButtonThemeData _floatButtonLight(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    backgroundColor: LightColor.mainColor,
    foregroundColor: LightColor.textColor,
  );
}

ListTileThemeData _listTileLight(ListTileThemeData base) {
  return base.copyWith(
      selectedTileColor: LightColor.mainLightColor,
      selectedColor: LightColor.textColor);
}
