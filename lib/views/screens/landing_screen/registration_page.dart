import 'dart:ui';

import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHosteler = true;
  List<String> genderList = <String>['Male', 'Female', 'Others'];
  List<String> branchList = <String>['CSE', 'CSE-AIML', 'CSE-DS', 'CS', 'AIML', 'CSIT', 'IT', 'ECE', 'EN', 'ME', 'CE'];
  List<String> sectionList = <String>['S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8', 'S9', 'S10', 'S11', 'S12', 'S13', 'S14', 'S15', 'S16', 'S17', 'S18', 'S19', 'S20'];
  String gender = "Male";
  String branch = "CSE";
  String section = "S1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Name",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "College email id",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Student Number",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text("Branch?", style: TextStyle(color: Colors.white),),
                            SizedBox(width: 100,),
                            DropdownButton<String>(
                              value: branch,
                              elevation: 16,
                              dropdownColor: Colors.black12,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (String? value) {
                                setState(() {
                                  branch = value!;
                                });
                              },
                              items: branchList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text("Section?", style: TextStyle(color: Colors.white),),
                            SizedBox(width: 100,),
                            DropdownButton<String>(
                              value: section,
                              elevation: 16,
                              dropdownColor: Colors.black12,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (String? value) {
                                setState(() {
                                  section = value!;
                                });
                              },
                              items: sectionList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text('Is Hosteler?', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 60,),
                            Radio(
                              value: true,
                              groupValue: isHosteler,
                              onChanged: (value) {
                                setState(() {
                                  isHosteler = value as bool;
                                });
                              },
                            ),
                            Text('Yes', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 60,),
                            Radio(
                              value: false,
                              groupValue: isHosteler,
                              onChanged: (value) {
                                setState(() {
                                  isHosteler = value as bool;
                                });
                              },
                            ),
                            Text('No', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text("Gender?", style: TextStyle(color: Colors.white),),
                            SizedBox(width: 100,),
                            DropdownButton<String>(
                              value: gender,
                              elevation: 16,
                              dropdownColor: Colors.black12,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              items: genderList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Hackerrank id",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: ElevatedButton(
                            onPressed: (){},
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
