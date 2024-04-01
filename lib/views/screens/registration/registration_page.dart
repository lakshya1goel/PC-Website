import 'dart:convert';
import 'dart:ui';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:pcwebsite/services/api_services.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';
import 'package:pcwebsite/views/widgets/registration/custom_dropdown.dart';
import 'package:pcwebsite/views/widgets/registration/custom_textform_field.dart';
import '../../../controllers/registration/validations.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/toasts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHosteler = true;
  bool isContestOnly = false;
  List<String> genderList = ['Male', 'Female', 'Others'];
  List<String> branchList = <String>['CSE', 'CSE-AIML', 'CSE-DS', 'CS', 'AIML', 'CSIT', 'IT', 'ECE', 'EN', 'ME', 'CE'];
  List<String> sectionList = List.generate(20, (index) => 'S${index + 1}');
  String gender = 'Male';
  String branch = 'CSE';
  String section = 'S1';
  String registeredFor = "Workshop";
  String recaptchaToken = "";
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController studentNumber = TextEditingController();
  TextEditingController universityRollNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController hackerrankId = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                constraints: const BoxConstraints(maxWidth: 600),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(label: "First Name", controller: firstName,),
                      CustomTextFormField(label: "Last Name", controller: lastName,),
                      CustomTextFormField(label: "Student Number", controller: studentNumber,),
                      CustomTextFormField(label: "University Roll No.", controller: universityRollNo,),
                      CustomTextFormField(label: "College email id", controller: email,),
                      CustomTextFormField(label: "Contact Number", controller: contactNo,),
                      CustomTextFormField(label: "Hackerrank id", controller: hackerrankId,),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Branch", style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 20),
                          CustomDropDown(val: branch, list: branchList,
                            onChanged: (String? value) {
                              setState(() {
                                branch = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Section", style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 20),
                          CustomDropDown(val: section, list: sectionList,
                            onChanged: (String? value) {
                              setState(() {
                                section = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Gender", style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 20),
                          CustomDropDown(val: gender, list: genderList,
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (isSmallScreen) ...[
                        const Row(
                          children: [
                            Text('Hosteler', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                      Row(
                        children: [
                          if (!isSmallScreen) ...[
                            const Text('Hosteler', style: TextStyle(color: Colors.white)),
                            const SizedBox(width: 20),
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
                              const Text('Yes', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(width: 20),
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
                              const Text('No', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (isSmallScreen) ...[
                        const Row(
                          children: [
                            Text('Register For', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                      Row(
                        children: [
                          if (!isSmallScreen) ...[
                            const Text('Register For', style: TextStyle(color: Colors.white)),
                            const SizedBox(width: 20),
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
                              const Text('Workshop', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(width: 20),
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
                              const Text('Contest', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(width: 20),
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
                              const Text('Both', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: CustomButton(
                            title: 'Register',
                            formKey: formKey,
                            fn: () async {
                              if (formKey.currentState!.validate()) {
                                if (!Validator().validateName(firstName.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid first name']);
                                  return;
                                }
                                if (!Validator().validateName(lastName.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid last name']);
                                  return;
                                }
                                if (!Validator().validateStudentNum(studentNumber.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid student number']);
                                  return;
                                }
                                if (!Validator().validateUniversityRollNum(universityRollNo.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid university roll number']);
                                  return;
                                }
                                if (!Validator().validateCollegeEmail(email.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid College email']);
                                  return;
                                }
                                if (!Validator().validateMobileNum(contactNo.text.trim())) {
                                  CustomToasts().showToast([false, 'Enter a valid mobile number']);
                                  return;
                                }
                                if (!Validator().validHackerrankId(hackerrankId.text.trim())) {
                                  CustomToasts().showToast([false, 'Hackerrank Id can not be empty']);
                                  return;
                                }
                                String token = await ApiService(dotenv.env['API_BASE_URL']!).generateToken();
                                recaptchaToken = token;
                                var response = await ApiService(
                                    dotenv.env['API_BASE_URL']!).registerUser(
                                  firstName.text.trim(),
                                  lastName.text.trim(),
                                  contactNo.text.trim(),
                                  gender,
                                  email.text.trim(),
                                  studentNumber.text.trim(),
                                  branch,
                                  section,
                                  isHosteler,
                                  hackerrankId.text.trim(),
                                  isContestOnly,
                                  recaptchaToken,
                                  universityRollNo.text.trim(),
                                );
                                var responseBody = jsonDecode(response.body);
                                if (response.statusCode == 201) {
                                  firstName.dispose();lastName.dispose();contactNo.dispose();
                                  email.dispose();studentNumber.dispose();hackerrankId.dispose();
                                  universityRollNo.dispose();
                                  CustomToasts().showToast([true, responseBody['message']]);
                                  registered = true;
                                  router.go('/thankyou');
                                }
                                else {
                                CustomToasts().showToast([false, responseBody['message']]);
                              }
                              FocusScope.of(context).unfocus();
                            }
                            else {
                              CustomToasts().showToast([false, 'Enter all required fields']);
                            }},
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
