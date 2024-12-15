import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:the_movie/core/utils/validator.dart';

class ForgotPassVerifyIdentityW extends HookWidget {
  const ForgotPassVerifyIdentityW({
    super.key,
    this.onSubmitPressed,
  });

  final VoidCallback? onSubmitPressed;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> forgetVerifyFormKey = GlobalKey();

    final emailIdController = useTextEditingController();
    final employeeCodeController = useTextEditingController();

    return Form(
      key: forgetVerifyFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: AppStrings.forgetPassword,
            style: AppTextStyle.getH4TextStyle(),
          ),
          const SizedBox(height: AppSpacing.height5),
          AppText(
            text: AppStrings.provideForgotPasswordInfo,
            style: AppTextStyle.getH6TextStyle(),
          ),
          const SizedBox(height: AppSpacing.height20),
          LabelTextFieldW(
            controller: employeeCodeController,
            headerText: AppStrings.employeeCode,
            hintText: AppStrings.enterEmployeeCode,
            prefixIcon: Icon(
              Icons.account_circle_outlined,
              color: const Color(0xff737373).withOpacity(0.3),
              size: 21,
            ),
            validator: (v) => Validator.validateFieldNotEmpty(v),
          ),
          const SizedBox(height: AppSpacing.height10),
          LabelTextFieldW(
            controller: emailIdController,
            headerText: AppStrings.email,
            hintText: AppStrings.enterEmailId,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: const Color(0xff737373).withOpacity(0.3),
              size: 21,
            ),
            validator: (v) => Validator.validateEmail(v),
          ),
          const SizedBox(height: AppSpacing.height20),
          AppElevatedButton(
            text: AppStrings.submit,
            onPressed: () {
              if (forgetVerifyFormKey.currentState?.validate() ?? false) {
                onSubmitPressed?.call();
              }
            },
          ),
        ],
      ),
    );
  }
}
