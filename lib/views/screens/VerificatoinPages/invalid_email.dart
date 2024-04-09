import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class InvalidEmail extends StatelessWidget {
  const InvalidEmail({super.key});

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
                    Center(
                      child: SizedBox(
                          height: max(250,screenWidth*0.4),
                          width: max(250,screenWidth*0.4),
                          child: const Column(
                            children: [
                              Text('Invalid Token!!',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
