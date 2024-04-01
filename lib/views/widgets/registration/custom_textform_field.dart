import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  CustomTextFormField({super.key, required this.label, required this.controller, this.validator, this.onChanged});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Form(
          key: _key,
          autovalidateMode: AutovalidateMode.onUserInteraction  ,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
