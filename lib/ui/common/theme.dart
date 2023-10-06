import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    textTheme: TextTheme(
        titleLarge: GoogleFonts.acme(fontSize: 50.sp),
        bodyMedium: const TextStyle(
          fontSize: AppFontSizes.small,
        ),
        titleMedium: TextStyle(fontSize: 22.sp, color: Colors.white),
        titleSmall: const TextStyle(
          fontSize: AppFontSizes.smallLarge,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
            fontSize: AppFontSizes.smallLarge, fontWeight: FontWeight.normal),
        labelSmall: const TextStyle(
            fontSize: AppFontSizes.smallMedium, fontWeight: FontWeight.normal),
        labelLarge: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black)),
  );

  // static
}
