import 'package:flutter/material.dart';
import 'package:pcwebsite/views/screens/landing_screen/landing_page.dart';
import 'package:pcwebsite/views/screens/landing_screen/registration_page.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PC Website',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}