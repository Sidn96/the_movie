import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:the_movie/core/common_ui/widgets/underline_button_w.dart';

class SignUpIdInputW extends StatelessWidget {
  const SignUpIdInputW({
    super.key,
    required this.userIdController,
    this.onContinuePressed,
    this.onLoginPressed,
  });

  final TextEditingController userIdController;
  final VoidCallback? onContinuePressed;
  final VoidCallback? onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: AppStrings.enterEmailId,
          style: AppTextStyle.getH4TextStyle(),
        ),
        const SizedBox(height: AppSpacing.height20),
        AppText(
          text: AppStrings.employeeCode,
          style: AppTextStyle.getH4TextStyle(),
        ),
        const SizedBox(height: AppSpacing.height5),
        AppTextField(
          controller: userIdController,
          hintText: AppStrings.enterEmailId,
        ),
        const SizedBox(height: AppSpacing.height10),
        AppElevatedButton(
          text: AppStrings.continueStr,
          onPressed: onContinuePressed,
        ),
        const SizedBox(height: AppSpacing.height10),
        Center(
          child: UnderlineButtonW(
            label: AppStrings.login,
            onPressed: onLoginPressed,
          ),
        )
      ],
    );
  }
}
