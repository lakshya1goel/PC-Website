import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:pcwebsite/services/api_services.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/views/screens/landing_screen/landing_page.dart';
import 'package:pcwebsite/views/screens/registration/registration_page.dart';
import 'package:pcwebsite/views/screens/thank_you/thank_you.dart';


final GoRouter router = GoRouter(
  redirect: (BuildContext context, GoRouterState state){
    if (state.path == '/register'|| state.path == '/thankyou') {
      return null;
    } else {
      return '/';
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: RegistrationPage(),fullscreenDialog: true);
      },
    ),
    GoRoute(
      redirect: _redirectHome,
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: RegistrationPage(),fullscreenDialog: true);
      },
    ),
    GoRoute(
      redirect: _redirectRegister,
      path: '/thankyou',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: ThankYou(),fullscreenDialog: true);
      },
    ),
  ],
);

Future<String?> _redirectHome(BuildContext context, GoRouterState state) async {
  Duration timeLeft = await ApiService(dotenv.env['API_BASE_URL']!).parseDurationFromAPI();
  bool notAllowed = (timeLeft.inSeconds <= 0);
  if(notAllowed) {
    return '/';
  } else {
    return null;
  }
}

Future<String?> _redirectRegister(BuildContext context, GoRouterState state) async {
  Duration timeLeft = await ApiService(dotenv.env['API_BASE_URL']!).parseDurationFromAPI();
  bool notAllowed = (timeLeft.inSeconds <= 0);
  if(notAllowed){
    return '/';
  }
  else if(!registered){
    return '/register';
  }
  else{
    return null;
  }
}
