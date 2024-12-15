import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:go_router/go_router.dart';

import 'app_positive_negative_btn_w.dart';

class AppDialogW extends HookWidget {
  final String? title;
  final String? subTitle;
  final String positiveLabel;
  final String negativeLabel;
  final Widget body;
  final bool showCloseIcon;
  final bool showCloseButton;
  final VoidCallback? onPositiveClick;
  final VoidCallback? onNegativeClick;
  final VoidCallback? onClose;

  const AppDialogW({
    super.key,
    this.title,
    this.subTitle,
    this.positiveLabel = AppStrings.save,
    this.negativeLabel = AppStrings.cancel,
    required this.body,
    this.showCloseIcon = true,
    this.showCloseButton = false,
    this.onPositiveClick,
    this.onNegativeClick,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showCloseIcon)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    onClose?.call();
                    context.pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          AppPageHeaderTileW(
            title: title,
            subTitle: subTitle,
          ),
          const SizedBox(height: AppSpacing.height10),
          body,
          const SizedBox(height: AppSpacing.height5),
          showCloseButton
              ? AppElevatedButton(
                  onPressed: () {
                    onClose?.call();
                    context.pop();
                  },
                  text: AppStrings.close,
                  width: 150,
                )
              : AppPositiveNegativeBtnW(
                  positiveLabel: positiveLabel,
                  negativeLabel: negativeLabel,
                  onPositiveClick: onPositiveClick,
                  onNegativeClick: onNegativeClick,
                ),
        ],
      ),
    );
  }
}
