import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String val;
  final List<String> list;
  final ValueChanged<String?> onChanged;
  const CustomDropDown({super.key, required this.val, required this.list, required this.onChanged});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.black12,
      value: widget.val,
      style: TextStyle(color: Colors.white),
      onChanged: widget.onChanged,
      items: widget.list
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
          .toList(),
    );
  }
}
