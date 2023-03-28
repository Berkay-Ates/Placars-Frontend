import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get deviceWith => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  TextTheme get themeText => Theme.of(this).textTheme;
  ColorScheme get themeColor => Theme.of(this).colorScheme;
}
