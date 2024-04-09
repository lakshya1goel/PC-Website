import 'dart:math' hide log;
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:pcwebsite/utils/constants/data/social_data.dart';
import 'package:pcwebsite/views/widgets/custom_social_media_button.dart';
import 'package:pcwebsite/views/widgets/register_now.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String baseUrl = dotenv.get('API_BASE_URL');
  TextEditingController emailController = TextEditingController();

  Duration? duration;
  bool registrationReady = true;
  @override
  void initState() {
    GRecaptchaV3.hideBadge();
    super.initState();
  }


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register for #include 3.0',
                          style: TextStyle(
                            fontSize: max(40, screenWidth * 0.05),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            height:(screenWidth < 500 ? 50 : 100)),
                        const RegisterNowButton(),
                        const SizedBox(height: 50,)
                      ],
                    ),
                    SocialMediaIconsRow(socialMediaIcons: socialMediaIcons),
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
