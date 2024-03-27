import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pcwebsite/views/widgets/custom_input_field.dart';
import 'package:slide_countdown/slide_countdown.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      '#include 3.0 Coming Soon',
                      style: TextStyle(
                        fontSize: (60/screenWidth)*screenWidth,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
                     SizedBox(height: screenWidth <= 500 ?50:100),
                    SlideCountdownSeparated(
                      duration: const Duration(days: 2),
                      style: TextStyle(
                        fontSize: screenWidth <= 500 ?20:50,
                        color: Colors.white,
                      ),
                      separatorStyle: TextStyle(
                        fontSize: screenWidth <= 500 ?20:50,
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
                      width: screenWidth >= 580?480:380, // Adjusted width to be 80% of screen width
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomInputField(),
                              const SizedBox(width: 20,),
                              if(screenWidth >= 500)
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
                          if(screenWidth < 500)
                          const SizedBox(height: 30),
                          if(screenWidth < 500)
                            SizedBox(
                                height: 40,
                                width: screenWidth <= 500 ?screenWidth*0.50:120,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  ),
                                  child: const Text('Subscribe'),
                                )
                            ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/instagram.png')),
                              const SizedBox(width: 20,),
                              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/linkedin.png')),
                              const SizedBox(width: 20,),
                              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/twitter.png')),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
