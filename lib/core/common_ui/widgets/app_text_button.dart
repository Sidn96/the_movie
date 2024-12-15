import 'package:flutter/material.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final bool hasUnderline;
  final double elevation;
  final double? horizontalPadding;

  const AppTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = Colors.blue, // Default color is blue
    this.textColor = Colors.white, // Default text color is white
    this.isLoading = false, // Default is not loading
    this.hasUnderline = false,
    this.elevation = 2.0, // Default elevation
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed, // Disable button if loading
      style: TextButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.symmetric(
            vertical: 16, horizontal: horizontalPadding ?? 24),
      ),
      child: isLoading
          ? const AppLoader(
              color: Colors.blue,
            )
          : AppText(
              text: text,
              style: AppTextStyle.getH4TextStyle(
                  color: textColor,
                  decoration: hasUnderline ? TextDecoration.underline : null),
            ),
    );
  }
}
