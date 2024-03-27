import 'dart:ui';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.white, width: 1.0),
          color: Colors.white.withOpacity(0.2), // Adjust opacity for frosted glass effect
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur radius
            child: TextField(
              style: const TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
