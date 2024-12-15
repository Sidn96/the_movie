import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double elevation;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const AppElevatedButton({
    super.key,
    required this.text,
    this.color = Colors.blue, // Default color is blue
    this.textColor = Colors.white, // Default text color is white
    this.isLoading = false, // Default is not loading
    this.elevation = 2.0, // Default elevation
    this.width = double.infinity,
    this.height = AppSpacing.height40,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.gray,
        backgroundColor: AppColors.brand,
        maximumSize: Size(width, height),
        minimumSize: Size(width, height),
        elevation: elevation,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
        ),
        textStyle: AppTextStyle.getH4TextStyle(
          color: AppColors.white,
        ),
      ),
      onPressed: isLoading ? null : onPressed, // Disable button if loading
      child: isLoading
          ? const AppLoader()
          : AppText(
              text: text,
              style: AppTextStyle.getH4TextStyle(
                color: textColor,
              ),
            ),
    );
  }
}
