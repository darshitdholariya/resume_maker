import 'package:code/constants/color.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.selectedEmirate,
    required this.label,
    required this.emiratesList,
    required this.onChange,
  }) : super(key: key);

  final String selectedEmirate;
  final String label;
  final List<String> emiratesList;
  final Function(String?) onChange;

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
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: kColorGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedEmirate,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.grey[800]),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: onChange,
                  items: emiratesList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
