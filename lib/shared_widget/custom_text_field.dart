import 'package:code/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.controller,
      required this.hint,
      required this.label,
      required this.inputType,
      this.onSubmit});

  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType inputType;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          style: TextStyle(
            color: Colors.grey[800],
          ),
          cursorColor: Colors.black,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            filled: true,
            fillColor: kColorGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.25),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
