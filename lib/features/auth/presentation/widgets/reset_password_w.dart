import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class ResetPasswordW extends HookWidget {
  final Function()? onResetPressed;
  const ResetPasswordW({
    super.key,
    this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Center(
      child: Form(
        key: resetPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: AppStrings.createNewPassword,
              style: AppTextStyle.getH4TextStyle(),
            ),
            const SizedBox(height: AppSpacing.height5),
            AppText(
              text: AppStrings.newPasswordDifferentFromPrevious,
              style: AppTextStyle.getH6TextStyle(),
            ),
            // AppTextField(
            //   controller: currentPasswordController,
            //   hintText: AppStrings.currentPassword,
            //   obscureText: true,
            // ),
            const SizedBox(height: 20),
            AppPasswordField(
                controller: newPasswordController,
                headerText: AppStrings.newPassword,
                hintText: AppStrings.enterPassword),
            const SizedBox(height: 20),
            AppPasswordField(
                controller: confirmPasswordController,
                headerText: AppStrings.confirmPassword,
                hintText: AppStrings.enterPassword),
            const SizedBox(height: 10),
            AppElevatedButton(
              text: AppStrings.signIn,
              onPressed: () {
                if (resetPasswordFormKey.currentState?.validate() ?? false) {
                  onResetPressed?.call();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
