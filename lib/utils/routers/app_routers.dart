import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/views/screens/landing_screen/landing_page.dart';
import 'package:pcwebsite/views/screens/registration/registration_page.dart';
import 'package:pcwebsite/views/screens/thank_you/thank_you.dart';


final GoRouter router = GoRouter(
  redirect: _redirect,
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: LandingPage(),fullscreenDialog: true);
      },
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: RegistrationPage(),fullscreenDialog: true);
      },
    ),
    GoRoute(
      name: 'thankyou',
      path: '/thankyou',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: ThankYou(),fullscreenDialog: true);
      },
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  if(canGoFurther) return null;
  return '/';
}
