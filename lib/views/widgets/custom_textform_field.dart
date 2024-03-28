import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  const CustomTextFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
