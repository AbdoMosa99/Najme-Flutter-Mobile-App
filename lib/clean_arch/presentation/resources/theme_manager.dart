import 'package:flutter/material.dart';
import 'utils.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // Main Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.surface,
    splashColor: ColorManager.primaryLight,
    // App Bar
    appBarTheme: AppBarTheme(),
    // Button
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.background,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryLight,
      // shape: StadiumBorder(),
    ),
    // Text
    textTheme: TextTheme(),
    // Text Form Field
    inputDecorationTheme: InputDecorationTheme(),
  );
}
