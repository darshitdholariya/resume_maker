import 'package:flutter/material.dart';

class ViewDetailTile extends StatelessWidget {
  const ViewDetailTile({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      if(value!.isNotEmpty) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    label + ': ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    value!,
                    style: TextStyle(color: Colors.grey[800], fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
