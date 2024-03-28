import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pcwebsite/views/screens/landing_screen/recaptcha.dart';
import 'package:pcwebsite/views/widgets/custom_dropdown.dart';
import 'package:pcwebsite/views/widgets/custom_textform_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHosteler = true;
  List<String> genderList = ['Male', 'Female', 'Others'];
  List<String> branchList = <String>['CSE', 'CSE-AIML', 'CSE-DS', 'CS', 'AIML', 'CSIT', 'IT', 'ECE', 'EN', 'ME', 'CE'];
  List<String> sectionList = List.generate(20, (index) => 'S${index + 1}');
  String gender = 'Male';
  String branch = 'CSE';
  String section = 'S1';
  String registeredFor = "Both";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 460;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundImg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10.0),
              child: Container(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(maxWidth: 600),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(label: "First Name"),
                      CustomTextFormField(label: "Last Name"),
                      CustomTextFormField(label: "Student Number"),
                      CustomTextFormField(label: "University Roll No."),
                      CustomTextFormField(label: "College email id"),
                      CustomTextFormField(label: "Contact Number"),
                      CustomTextFormField(label: "Hackerrank id"),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Branch", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          CustomDropDown(val: branch, list: branchList,
                            onChanged: (String? value) {
                              setState(() {
                                branch = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Section", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          CustomDropDown(val: section, list: sectionList,
                            onChanged: (String? value) {
                              setState(() {
                                section = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Gender", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          CustomDropDown(val: gender, list: genderList,
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (isSmallScreen) ...[
                        Row(
                          children: [
                            Text('Hosteler', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                      Row(
                        children: [
                          if (!isSmallScreen) ...[
                            Text('Hosteler', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: isHosteler,
                                onChanged: (value) {
                                  setState(() {
                                    isHosteler = value as bool;
                                  });
                                },
                              ),
                              Text('Yes', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Radio(
                                value: false,
                                groupValue: isHosteler,
                                onChanged: (value) {
                                  setState(() {
                                    isHosteler = value as bool;
                                  });
                                },
                              ),
                              Text('No', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (isSmallScreen) ...[
                        Row(
                          children: [
                            Text('Register For', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                      Row(
                        children: [
                          if (!isSmallScreen) ...[
                            Text('Register For', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                          Row(
                            children: [
                              Radio(
                                value: "Workshop",
                                groupValue: registeredFor,
                                onChanged: (value) {
                                  setState(() {
                                    registeredFor = value as String;
                                  });
                                },
                              ),
                              Text('Workshop', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Radio(
                                value: "Contest",
                                groupValue: registeredFor,
                                onChanged: (value) {
                                  setState(() {
                                    registeredFor = value as String;
                                  });
                                },
                              ),
                              Text('Contest', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Radio(
                                value: "Both",
                                groupValue: registeredFor,
                                onChanged: (value) {
                                  setState(() {
                                    registeredFor = value as String;
                                  });
                                },
                              ),
                              Text('Both', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 120,
                          child: RecaptchaWidget()),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Register"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
