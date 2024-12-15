import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppEmptyViewW extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const AppEmptyViewW({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: AppRadius.lg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: title ?? "Your data is empty",
                style: AppTextStyle.getH3TextStyle(),
              ),
              const SizedBox(height: AppSpacing.height20),
              AppText(
                text: subtitle ?? "There is nothing to show",
              )
            ],
          ),
        ),
      ),
    );
  }
}
