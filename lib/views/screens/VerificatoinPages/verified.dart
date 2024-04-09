import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Verified extends StatelessWidget {
  const Verified({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgroundImg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: max(250,screenWidth*0.4),
                        width: max(250,screenWidth*0.4),
                        child: Image.asset('assets/thank_you.png',),
                    ),
                    const Text('This email is verified Successfully!!',style: TextStyle(
                      fontSize: 30,
                    ),),
                    const Text('!!❤️SEE YOU IN WORKSHOP❤️!!',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
