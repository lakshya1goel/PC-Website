import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';
import 'package:url_strategy/url_strategy.dart';


Future main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if(kIsWeb){
    bool ready = await GRecaptchaV3.ready('6LfF6aYpAAAAALksYL9nChKJRosu5-sV7ADaPPm0');
    print("Is Recaptcha ready? $ready");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Programming Club',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}