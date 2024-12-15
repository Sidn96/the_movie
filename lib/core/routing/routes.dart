import 'package:flutter/material.dart';
import 'package:the_movie/core/routing/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie/features/home/presentation/pages/home_page.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splash,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: HomePage());
      },
    ),
    
  ],
);
