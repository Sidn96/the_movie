import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:the_movie/features/auth/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginW extends HookWidget {
  const LoginW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginUserIdController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isForgotPasswordPressed = useState(false);
    final isForgotPasswordInfoSubmitted = useState(false);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        
          const SizedBox(height: AppSpacing.height30),
          isForgotPasswordPressed.value
              ? isForgotPasswordInfoSubmitted.value
                  ? const ResetPasswordW()
                  : ForgotPassVerifyIdentityW(
                      onSubmitPressed: () {
                        isForgotPasswordPressed.value = false;
                      },
                    )
              : UserIdInputW(
                  userIdController: loginUserIdController,
                  passwordController: passwordController,
                  onContinuePressed: () {
                    context.pushReplacement(RouteNames.dashboard);
                  },
                  onForgetPassPressed: () {
                    isForgotPasswordPressed.value = true;
                  },
                ),
          const SizedBox(height: AppSpacing.height10),
          const TermsAndConditionsW()
        ],
      ),
    );
  }
}

//  isUsernameSubmitted.value
//               ? isFogotPasswordPressed.value
//                   ? ForgotPassVerifyIdentityW(
//                       emailIdController: emailIdController,
//                       onVerifyPressed: () {
//                         isFogotPasswordPressed.value = false;
//                       },
//                     )
//                   : LoginPasswordInputW(
//                       passwordController: passwordController,
//                       onContinuePressed: () {},
//                       onForgetPassPressed: () {
//                         emailIdController.text = "sagar9907@gmail.com";
//                         isFogotPasswordPressed.value = true;
//                       },
//                     )
//               : isSignupPressed.value
//                   ? SignUpIdInputW(
//                       userIdController: signUpUserIdController,
//                       onContinuePressed: () {},
//                       onLoginPressed: () {
//                         isSignupPressed.value = false;
//                       },
//                     )
//                   : UserIdInputW(
//                       userIdController: loginUserIdController,
//                       passwordController: passwordController,
//                       onContinuePressed: () {
//                         isUsernameSubmitted.value = true;
//                       },
//                       onSignupPressed: () {
//                         isSignupPressed.value = true;
//                       },
//                       onForgetPassPressed: () {
//                         isFogotPasswordPressed.value = true;
//                       },
//                     ),