import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:pcwebsite/services/api_services.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/utils/constants/timer/config.dart';
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
      redirect: _redirectHome,
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
  ],
);

Future<String?> _redirectHome(BuildContext context, GoRouterState state) async {
  Duration timeLeft = await ApiService(dotenv.env['API_BASE_URL']!).parseDurationFromAPI();
  bool notAllowed = (timeLeft.inSeconds > 0);
  if(notAllowed) {
    CustomToasts().showToast([false,'Registrations are not started yet']);
    return '/';
  } else {
    return null;
  }
}

Future<String?> _redirectRegister(BuildContext context, GoRouterState state) async {
  Duration timeLeft = await ApiService(dotenv.env['API_BASE_URL']!).parseDurationFromAPI();
  bool notAllowed = (timeLeft.inSeconds > 0);
  if(notAllowed){
    CustomToasts().showToast([false,'Registrations are not started yet']);
    return '/';
  }
  else if(!registered){
    CustomToasts().showToast([false,'Please register first']);
    return '/register';
  }
  else{
    return null;
  }
}
