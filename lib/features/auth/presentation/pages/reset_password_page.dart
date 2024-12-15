import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:the_movie/core/utils/validator.dart';
import 'package:the_movie/features/auth/presentation/widgets/terms_conditions_w.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColors.grayLight[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Container(
            width: 440,
            padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.lg,
            ),
            child: Form(
              key: resetPasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  const SizedBox(height: AppSpacing.height30),
                  AppPasswordField(
                    headerText: AppStrings.newPassword,
                    controller: newPasswordController,
                    hintText: AppStrings.newPassword,
                    validator: (v) =>
                        Validator.validatePassword(value: v ?? ""),
                  ),
                  const SizedBox(height: 20),
                  AppPasswordField(
                    headerText: AppStrings.confirmPassword,
                    controller: confirmPasswordController,
                    hintText: AppStrings.confirmPassword,
                    validator: (v) => Validator.reConfirmPassword(
                        mainValue: newPasswordController.text,
                        confirmValue: confirmPasswordController.text),
                  ),
                  const SizedBox(height: AppSpacing.height30),
                  AppElevatedButton(
                    text: AppStrings.submit,
                    onPressed: () {
                      if (resetPasswordFormKey.currentState?.validate() ??
                          false) {
                        context.pushReplacement(RouteNames.dashboard);
                      }
                    },
                  ),
                  const SizedBox(height: AppSpacing.height10),
                  const TermsAndConditionsW()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
