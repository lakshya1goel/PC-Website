import 'dart:math';

import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';
import 'package:simple_animated_button/simple_animated_button.dart';
import 'package:flutter/material.dart';

class RegisterNowButton extends StatelessWidget {
  const RegisterNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    canGoFurther = true;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){},
      child: ElevatedLayerButton(
        onClick: () {
          router.go('/register');
        },
        buttonHeight: 60,
        buttonWidth: min(screenWidth*0.5,270),
        animationDuration: const Duration(milliseconds: 200),
        animationCurve: Curves.ease,
        topDecoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(),
        ),
        topLayerChild: const Text(
          "Register Now -> ",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
        baseDecoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(),
        ),
      ),
    );
  }
}
