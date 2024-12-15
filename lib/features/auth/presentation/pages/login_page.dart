import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:the_movie/features/auth/presentation/widgets/user_id_input_w.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginUserIdController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColors.grayLight[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       
                        const SizedBox(height: AppSpacing.height30),
                        UserIdInputW(
                          userIdController: loginUserIdController,
                          passwordController: passwordController,
                          onContinuePressed: () {
                            context.pushReplacement(RouteNames.dashboard);
                          },
                          onForgetPassPressed: () {
                            context.pushReplacement(RouteNames.forgetpassword);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.height10),
            ],
          ),
        ),
      ),
    );
  }
}
