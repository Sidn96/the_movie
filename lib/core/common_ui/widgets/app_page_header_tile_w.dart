import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppPageHeaderTileW extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  const AppPageHeaderTileW({
    super.key,
    this.title,
    this.subTitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null && title!.isNotEmpty)
          AppText(
            text: title ?? "",
            style: titleStyle ?? AppTextStyle.getH3TextStyle(),
          ),
        if (subTitle != null && subTitle!.isNotEmpty)
          AppText(
            text: subTitle ?? "",
            style: subtitleStyle ??
                AppTextStyle.getH5TextStyle(color: AppColors.grayLight),
          ),
      ],
    );
  }
}
