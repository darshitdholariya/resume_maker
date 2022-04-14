import 'package:code/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    // required this.valid,
    // required this.preIcon,
    required this.hint,
    required this.label,
    required this.inputType,
    // required this.obsEnable,
    // this.obsText,
    // this.obsOnTap,
    this.onSubmit,
    // required this.textCapitalization,
    // this.inputFormatters,
    // this.maxLine = 1,
    // this.minLine = 1,
    // this.textInputAction,
  });

  final TextEditingController controller;

  // final FormFieldValidator<String>? valid;
  // final String preIcon;
  final String hint;
  final String label;
  final TextInputType inputType;

  // final bool? obsText;
  // final bool obsEnable;
  // final Function()? obsOnTap;
  final Function(String)? onSubmit;

  // final TextCapitalization textCapitalization;
  // final List? inputFormatters;
  // final int maxLine;
  // final int minLine;
  // final TextInputAction? textInputAction;

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
          // minLines: minLine,
          // maxLines: maxLine,
          // textInputAction: textInputAction,
          // textCapitalization: textCapitalization,
          // obscureText: !obsEnable ? false : obsText!,
          controller: controller,
          keyboardType: inputType,
          // validator: valid,
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
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: SvgPicture.asset(
            //     preIcon,
            //     color: Colors.black,
            //     // color: Colors.black.withOpacity(0.5),
            //   ),
            // ),
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
