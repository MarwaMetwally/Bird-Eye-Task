import 'package:birdeyes/core/style/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.greyLight,
    ),
  );
}
