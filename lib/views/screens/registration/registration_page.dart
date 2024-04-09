import 'dart:convert';
import 'dart:ui';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:pcwebsite/controllers/registration/text_editing_controller.dart';
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
  String registeredFor = "Workshop";
  TextControllers controllers = TextControllers();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    GRecaptchaV3.hideBadge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = size < 460;
    print('hello');
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(label: "First Name", controller: controllers.firstName,validator: (text){
                        if(Validator().validateName(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid First Name';
                        }
                      }),
                      CustomTextFormField(label: "Last Name", controller: controllers.lastName,),
                      CustomTextFormField(label: "Student Number", controller: controllers.studentNumber,validator: (text){
                        if(Validator().validateStudentNum(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid Student Number';
                        }
                      }),
                      CustomTextFormField(label: "University Roll No.", controller: controllers.universityRollNo,validator: (text){
                        if(Validator().validateUniversityRollNum(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid University Roll Number';
                        }
                      },),
                      CustomTextFormField(label: "College email id", controller: controllers.email,validator: (text){
                        if(Validator().validateCollegeEmail(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid College Email ID';
                        }
                      }),
                      CustomTextFormField(label: "Contact Number", controller: controllers.contactNo,validator: (text){
                        if(Validator().validateMobileNum(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid Contact Number';
                        }
                      }),
                      CustomTextFormField(label: "Hackerrank id", controller: controllers.hackerrankId,validator: (text){
                        if(Validator().validHackerrankId(text!)){
                          return null;
                        }
                        else {
                          return 'Please enter valid Hackerrank ID';
                        }
                      }),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Branch", style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 20),
                          CustomDropDown(val: studentModel.branch, list: branchList,
                            onChanged: (String? value) {
                              setState(() {
                                studentModel = studentModel.copyWith(branch: value!);
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
                          CustomDropDown(val: studentModel.section, list: sectionList,
                            onChanged: (String? value) {
                              setState(() {
                                studentModel = studentModel.copyWith(section: value!);
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
                          CustomDropDown(val: studentModel.gender, list: genderList,
                            onChanged: (String? value) {
                              setState(() {
                                studentModel = studentModel.copyWith(gender: value!);
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
                                groupValue: studentModel.is_hosteler,
                                onChanged: (value) {
                                  setState(() {
                                    studentModel = studentModel.copyWith(is_hosteler: value!);
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
                                groupValue: studentModel.is_hosteler,
                                onChanged: (value) {
                                  setState(() {
                                    studentModel = studentModel.copyWith(is_hosteler: value!);
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
                              const Text('Workshop + Contest', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 98),
                        child: Row(
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
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: CustomButton(
                            title: 'Register',
                            formKey: _formKey,
                            fn: () async {
                              if (_formKey.currentState!.validate()) {
                                controllers.updateData()  ;
                                var response = await ApiService(
                                    dotenv.env['API_BASE_URL']!).registerUser(studentModel);
                                var responseBody = jsonDecode(response.body);
                                if (response.statusCode == 201) {
                                  CustomToasts().showToast([true, responseBody['message']]);
                                  registered = true;
                                  router.go('/thankyou');
                                }
                                else {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const RegistrationPage()));
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
