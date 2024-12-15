import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/core/common_ui/widgets/app_elevated_button.dart';
import 'package:the_movie/core/common_ui/widgets/app_outline_button.dart';

class AppPositiveNegativeBtnW extends StatelessWidget {
  final String positiveLabel;
  final String negativeLabel;
  final VoidCallback? onPositiveClick;
  final VoidCallback? onNegativeClick;
  const AppPositiveNegativeBtnW({
    super.key,
    required this.positiveLabel,
    required this.negativeLabel,
    this.onPositiveClick,
    this.onNegativeClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppOutlineButton(
          onPressed: onNegativeClick,
          text: negativeLabel,
          width: 150,
          textColor: AppColors.brand,
        ),
        const SizedBox(width: AppSpacing.height10),
        AppElevatedButton(
          onPressed: onPositiveClick,
          text: positiveLabel,
          width: 150,
        ),
      ],
    );
  }
}
