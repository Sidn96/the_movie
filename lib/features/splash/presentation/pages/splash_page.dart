import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/core/common_ui/widgets/app_text.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Use the Future.delayed to simulate loading time.
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        // Navigate to the next screen after the splash screen.
        context.pushReplacement(RouteNames.login);
      });
      return null; // No cleanup needed.
    }, []);

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            AppText(
              text: "Welcome",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
