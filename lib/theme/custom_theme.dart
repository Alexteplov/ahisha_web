import 'package:afisha_web/theme/components_style.dart';
import 'package:afisha_web/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: ThemeColors.white,
              onPrimary: ThemeColors.black,
              textStyle: ElButTextStyle.elBTextStyle),
        ),
      );
}
