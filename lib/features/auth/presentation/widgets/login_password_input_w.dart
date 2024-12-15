import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class LoginPasswordInputW extends StatelessWidget {
  const LoginPasswordInputW({
    super.key,
    required this.passwordController,
    this.onContinuePressed,
    this.onForgetPassPressed,
  });

  final TextEditingController passwordController;
  final VoidCallback? onContinuePressed;
  final VoidCallback? onForgetPassPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: AppStrings.welcomeback,
          style: AppTextStyle.getH4TextStyle(),
        ),
        const SizedBox(height: 10),
        AppPasswordField(
          controller: passwordController,
          headerText: AppStrings.password,
          hintText: AppStrings.enterPassword,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AppTextButton(
            text: AppStrings.forgetPassword,
            onPressed: onForgetPassPressed,
          ),
        ),
        const SizedBox(height: 10),
        AppElevatedButton(
          text: AppStrings.continueStr,
          onPressed: onContinuePressed,
        )
      ],
    );
  }
}
