import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:pcwebsite/services/api_services.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/views/screens/VerificatoinPages/already_verified.dart';
import 'package:pcwebsite/views/screens/VerificatoinPages/invalid_email.dart';
import 'package:pcwebsite/views/screens/VerificatoinPages/verified.dart';
import 'package:pcwebsite/views/screens/landing_screen/landing_page.dart';
import 'package:pcwebsite/views/screens/registration/registration_page.dart';
import 'package:pcwebsite/views/screens/thank_you/thank_you.dart';
import 'package:pcwebsite/views/widgets/toasts.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: LandingPage());
      },
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: RegistrationPage());
      },
    ),
    GoRoute(
      redirect: _redirectRegister,
      path: '/thankyou',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: ThankYou());
      },
    ),
    GoRoute(
      path: '/verified',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: Verified());
      },
    ),
    GoRoute(
      path: '/already_verified',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: AlreadyVerified());
      },
    ),
    GoRoute(
      path: '/invalid',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: InvalidEmail());
      },
    ),
  ],
);


Future<String?> _redirectRegister(BuildContext context, GoRouterState state) async {
  if(!registered){
    CustomToasts().showToast([false,'Please register first']);
    return '/register';
  }
  else{
    return null;
  }
}
