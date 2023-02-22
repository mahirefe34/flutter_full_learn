import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColor._textColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(fontSize: 25, color: _lightColor._textColor)),
      colorScheme: const ColorScheme.light(),
    );
  }
}

class _LightColor {
  final Color _textColor = Colors.red;
}
