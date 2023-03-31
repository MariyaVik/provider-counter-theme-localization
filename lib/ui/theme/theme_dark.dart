import 'package:flutter/material.dart';

class DarkColor {
  static const Color backColor = Color(0xFF325444);
  static const Color mainColor = Colors.brown;
  static const Color mainLightColor = Color(0xFFBC9283);
  static const Color textColor = Colors.white;
  static const Color error = Color(0xFFE95255);
}

ThemeData _themeDark = ThemeData.dark();

final appThemeDark = _themeDark.copyWith(
  colorScheme: _schemeDark(_themeDark.colorScheme),
  scaffoldBackgroundColor: DarkColor.backColor,
  appBarTheme: _appBarDark(_themeDark.appBarTheme),
  listTileTheme: _listTileDark(_themeDark.listTileTheme),
  textTheme: _textDark(_themeDark.textTheme),
  floatingActionButtonTheme:
      _floatButtonDark(_themeDark.floatingActionButtonTheme),
);

ColorScheme _schemeDark(ColorScheme base) {
  return base.copyWith(
      error: DarkColor.error,
      primary: DarkColor.mainColor,
      onPrimary: DarkColor.textColor,
      background: DarkColor.backColor);
}

TextTheme _textDark(TextTheme base) {
  return base.copyWith(
    displayLarge: base.displayLarge!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: DarkColor.textColor,
    ),
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: DarkColor.textColor,
    ),
    headlineLarge: base.headlineLarge!.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: DarkColor.textColor,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: DarkColor.textColor,
    ),
  );
}

AppBarTheme _appBarDark(AppBarTheme base) {
  return base.copyWith(
      backgroundColor: DarkColor.mainColor,
      foregroundColor: DarkColor.textColor);
}

FloatingActionButtonThemeData _floatButtonDark(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    backgroundColor: DarkColor.mainColor,
    foregroundColor: DarkColor.textColor,
  );
}

ListTileThemeData _listTileDark(ListTileThemeData base) {
  return base.copyWith(
      selectedTileColor: DarkColor.mainLightColor,
      selectedColor: DarkColor.textColor);
}
