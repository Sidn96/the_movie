import 'package:flutter/material.dart';

import '../../../config/consts/app_colors.dart';
import '../styles/app_text_style.dart';
import 'app_text.dart';

class UnderlineButtonW extends StatelessWidget {
  const UnderlineButtonW({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.brand),
          ),
        ),
        child: AppText(
          text: label,
          style: AppTextStyle.getH4TextStyle(color: AppColors.brand),
        ),
      ),
    );
  }
}