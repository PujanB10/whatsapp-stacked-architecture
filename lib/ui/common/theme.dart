import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_font_sizes.dart';

class WhatsappTheme {
  static final ThemeData whatsappTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColor.primaryColor,
    ),
    // appBarTheme: const AppBarTheme(color: AppColor.primary),
    // floatingActionButtonTheme:
    // const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: AppFontSizes.small,
      ),
      titleMedium: TextStyle(
          fontSize: AppFontSizes.smallLarge, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          fontSize: AppFontSizes.smallLarge, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(
          fontSize: AppFontSizes.smallMedium, fontWeight: FontWeight.normal),
    ),
  );

  // static
}
