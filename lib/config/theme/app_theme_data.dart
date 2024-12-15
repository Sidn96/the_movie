import 'package:flutter/material.dart';

import '../../core/common_ui/common_ui.dart';
import '../consts/app_colors.dart';
import '../consts/app_radius.dart';
import '../consts/app_spacing.dart';

class AppThemeData {
  AppThemeData._();

  static final lightTheme = ThemeData(
    primaryColor: AppColors.brand,
    primaryColorLight: AppColors.brand,
    primaryColorDark: AppColors.brand,
    disabledColor: AppColors.brand,
    hintColor: AppColors.gray,
    dividerColor: AppColors.black,
    focusColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.white,
    dialogBackgroundColor: AppColors.white,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: AppColors.white,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
      size: 25,
    ),
    navigationRailTheme: NavigationRailThemeData(
      indicatorColor: AppColors.brand,
      backgroundColor: AppColors.black,
      indicatorShape: RoundedRectangleBorder(borderRadius: AppRadius.xs),
      selectedIconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      selectedLabelTextStyle:
          AppTextStyle.getH6TextStyle(color: AppColors.white),
      unselectedLabelTextStyle:
          AppTextStyle.getH6TextStyle(color: AppColors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.grayLight, // Set cursor color here
    ),
    dividerTheme: const DividerThemeData(color: AppColors.black),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      prefixIconColor: AppColors.fieldIconColor,
      suffixIconColor: AppColors.fieldIconColor,
      hintStyle: AppTextStyle.getH6TextStyle(color: AppColors.grayLight),
      errorStyle:
          AppTextStyle.getCustomStyle(fontSize: 12.0, color: AppColors.error),
      errorMaxLines: 1,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      border: OutlineInputBorder(
        borderRadius: AppRadius.lg,
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.lg,
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.lg,
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.lg,
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.lg,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      outlineBorder: const BorderSide(color: AppColors.gray),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, AppSpacing.height40)),
        maximumSize: WidgetStateProperty.all(
            const Size(double.infinity, AppSpacing.height40)),
        backgroundColor: WidgetStateProperty.all(AppColors.brand),
        elevation: WidgetStateProperty.all(2.0),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: AppRadius.lg),
        ),
        textStyle: WidgetStateProperty.all(
          AppTextStyle.getH4TextStyle(color: AppColors.white),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, AppSpacing.height40)),
        maximumSize: WidgetStateProperty.all(
            const Size(double.infinity, AppSpacing.height40)),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.brand),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: AppRadius.lg),
        ),
        textStyle: WidgetStateProperty.all(
          AppTextStyle.getH4TextStyle(color: AppColors.brand),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppColors.brand),
      ),
    ),
  );
}
