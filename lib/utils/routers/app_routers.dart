import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pcwebsite/views/screens/landing_screen/landing_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: LandingPage());
      },
      routes: const [],
    ),
  ],
);