import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pcwebsite/controllers/landing_page/validations.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: const TextStyle(color: Colors.white), // Text color
        decoration: InputDecoration(
          hintText: 'Email Address',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0,
              vertical: 12.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white), // Set border color to white
            borderRadius: BorderRadius.circular(50.0),
          )
        ),

        validator: (text){
          if(text!.isEmpty) return 'Please enter your college mail';
          text.trim();
          if(validateCollegeEmail(text)){
            return null;
          }
          else{
            return 'Please enter a valid college mail';
          }
        },
      ),
    );
  }
}
