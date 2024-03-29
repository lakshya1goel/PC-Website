import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pcwebsite/utils/constants/data/social_data.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';
import 'package:pcwebsite/views/widgets/custom_input_field.dart';
import 'package:pcwebsite/views/widgets/custom_social_media_button.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../services/api_services.dart';
import '../../widgets/custom_submit_button.dart';

class LandingPage extends StatefulWidget {

  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  Duration? timeLeft;
  String baseUrl = dotenv.get('API_BASE_URL');
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      fetchData();
    });
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      Duration duration = await ApiService(baseUrl).parseDurationFromAPI();
      setState(() {
        timeLeft = duration;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '#include 3.0 Coming Soon',
                      style: TextStyle(
                        fontSize: max(40, screenWidth * 0.05),
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
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenWidth < 500 ? 50 : 100),
                    SlideCountdownSeparated(
                      duration: timeLeft ?? const Duration(days: 100),
                      style: TextStyle(
                        fontSize: screenWidth < 500 ? screenWidth * 0.08 : 50,
                        color: Colors.white,
                      ),
                      separatorStyle: TextStyle(
                        fontSize: screenWidth < 500 ? screenWidth * 0.08 : 50,
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
                      padding: EdgeInsets.all(max(8, screenWidth * 0.015)),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: max(380, screenWidth * 0.2),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomInputField(controller: emailController,),
                                const SizedBox(
                                  width: 20,
                                ),
                                if (screenWidth >= 500)
                                  CustomButton(
                                    formKey: formKey,
                                    fn: () {
                                      if (formKey.currentState!.validate()) {
                                        ApiService(baseUrl).subscribeEmail(emailController.text);
                                      }
                                    },
                                  )
                              ],
                            ),
                            if (screenWidth < 500) const SizedBox(height: 30),
                            if (screenWidth < 500)
                              CustomButton(
                                formKey: formKey,
                                fn: () {
                                  if (formKey.currentState!.validate()) {
                                    ApiService(baseUrl).subscribeEmail(emailController.text);
                                  }
                                },
                              ),
                            const SizedBox(height: 50),
                            SocialMediaIconsRow(
                                socialMediaIcons: socialMediaIcons),
                          ],
                        ),
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
