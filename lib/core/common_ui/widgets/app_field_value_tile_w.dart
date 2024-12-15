import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppFieldValueTileW extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  const AppFieldValueTileW({
    super.key,
    this.title,
    this.subTitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (subTitle == null || subTitle!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: "$title :",
            style: titleStyle ?? AppTextStyle.getH4TextStyle(),
          ),
          const SizedBox(width: AppSpacing.height10),
          AppText(
            text: subTitle ?? "",
            style: subtitleStyle ??
                AppTextStyle.getH5TextStyle(color: AppColors.grayLight),
          ),
        ],
      ),
    );
  }
}
