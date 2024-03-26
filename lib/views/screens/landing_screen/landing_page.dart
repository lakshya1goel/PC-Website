import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pcwebsite/utils/constants/timer/config.dart';
import 'package:pcwebsite/views/widgets/custom_input_field.dart';
import 'package:slide_countdown/slide_countdown.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Column(
                  children: [
                    const Text(
                      '#include 3.0 Coming Soon',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Registration Opens in:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    SlideCountdownSeparated(
                      duration: const Duration(days: 2),
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                      separatorStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        shape: BoxShape.rectangle,
                        color: Colors.white.withOpacity(0.1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 430,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomInputField(),
                              const SizedBox(width: 20,),
                              SizedBox(
                                height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    child: const Text('Subscribe'),
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon: Image.asset('asset/icons/instagram.png')),
                              const SizedBox(width: 20,),
                              IconButton(onPressed: (){}, icon: Image.asset('asset/icons/linkedin.png')),
                              const SizedBox(width: 20,),
                              IconButton(onPressed: (){}, icon: Image.asset('asset/icons/twitter.png')),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


