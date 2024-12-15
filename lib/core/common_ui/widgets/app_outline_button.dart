import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/core/common_ui/styles/app_text_style.dart';
import 'package:the_movie/core/common_ui/widgets/app_text.dart';

class AppOutlineButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double elevation;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  const AppOutlineButton({
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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
      ),
      child: AppText(
        text: text,
        style: AppTextStyle.getH4TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
