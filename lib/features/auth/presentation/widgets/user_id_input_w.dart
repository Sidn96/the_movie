import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:the_movie/core/utils/validator.dart';
import 'package:the_movie/features/auth/presentation/components/captcha_w.dart';

class UserIdInputW extends StatelessWidget {
  const UserIdInputW({
    super.key,
    required this.userIdController,
    required this.passwordController,
    this.onContinuePressed,
    this.onForgetPassPressed,
  });

  final TextEditingController userIdController;
  final TextEditingController passwordController;
  final VoidCallback? onContinuePressed;
  final VoidCallback? onForgetPassPressed;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormKey = GlobalKey();

    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: AppStrings.loginHeader,
            style: AppTextStyle.getH4TextStyle(),
          ),
          const SizedBox(height: AppSpacing.height5),
          AppText(
            text: AppStrings.provideProfileInfo,
            style: AppTextStyle.getH6TextStyle(),
          ),
          const SizedBox(height: AppSpacing.height20),
          LabelTextFieldW(
            controller: userIdController,
            headerText: AppStrings.userName,
            hintText: AppStrings.enterUserName,
            prefixIcon: const Icon(
              Icons.account_circle_outlined,
              size: 20,
            ),
            validator: (s) => Validator.validateFieldNotEmpty(s),
          ),
          const SizedBox(height: AppSpacing.height20),
          AppPasswordField(
            controller: passwordController,
            headerText: AppStrings.password,
            hintText: AppStrings.enterPassword,
            validator: (s) => Validator.validatePassword(value: s),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              text: AppStrings.forgetPassword,
              horizontalPadding: 0.0,
              textColor: AppColors.brand,
              onPressed: () {
                onForgetPassPressed?.call();
              },
            ),
          ),
          const SizedBox(height: AppSpacing.height20),
          const CaptchaW(),
          const SizedBox(height: AppSpacing.height20),
          AppElevatedButton(
            text: AppStrings.signIn,
            onPressed: () {
              if (loginFormKey.currentState?.validate() ?? false) {
                if (isCaptchaValid.value) {
                  updateCaptchaErrorVisibility(false);
                  onContinuePressed?.call();
                } else {
                  updateCaptchaErrorVisibility(true);
                }
              } else {
                if (isCaptchaValid.value) {
                  updateCaptchaErrorVisibility(false);
                } else {
                  updateCaptchaErrorVisibility(true);
                }
              }
            },
          ),
          // const SizedBox(height: AppHeights.height10),
          // Center(
          //   child: UnderlineButtonW(
          //     label: AppStrings.signUp,
          //     onPressed: onSignupPressed,
          //   ),
          // ),
        ],
      ),
    );
  }
}
