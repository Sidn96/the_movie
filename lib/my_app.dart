import 'package:flutter/material.dart';
import 'package:the_movie/config/theme/app_theme_data.dart';
import 'package:the_movie/core/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FRM Hitachi',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      routerConfig: appRouter,
    );
  }
}
