import 'package:flutter/material.dart';
import 'package:placars/core/init/theme/i_app_theme.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight extends IAppTheme with LightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        colorScheme: _appColorScheme,
        unselectedWidgetColor: lightColorScheme!.white,
      );

  ColorScheme get _appColorScheme => ColorScheme(
      primary: lightColorScheme!.purple,
      primaryContainer: lightColorScheme!.white,
      secondary: lightColorScheme!.darkPurple,
      secondaryContainer: lightColorScheme!.lightBlue,
      surface: lightColorScheme!.white,
      background: lightColorScheme!.blue,
      error: lightColorScheme!.red,
      onPrimary: lightColorScheme!.white,
      onSecondary: lightColorScheme!.black,
      onSurface: lightColorScheme!.lightGray,
      onBackground: lightColorScheme!.gray,
      onError: lightColorScheme!.white,
      brightness: lightColorScheme!.brightnessLight);
}
