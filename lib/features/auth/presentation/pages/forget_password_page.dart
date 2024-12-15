import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:the_movie/features/auth/presentation/widgets/forgot_pass_verify_identity_w.dart';
import 'package:the_movie/features/auth/presentation/widgets/terms_conditions_w.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordPage extends HookWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                const SizedBox(height: AppSpacing.height30),
                ForgotPassVerifyIdentityW(
                  onSubmitPressed: () {
                    context.pushReplacement(RouteNames.resetpassword);
                  },
                ),
                const SizedBox(height: AppSpacing.height10),
                const TermsAndConditionsW()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
