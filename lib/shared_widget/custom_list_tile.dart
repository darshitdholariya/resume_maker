import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/screen/add/add_resume_screen.dart';
import 'package:code/screen/view_resume/view_resume_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import 'custom_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.data,
    required this.docId,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final String? docId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewResumeScreen(
              docId: docId,
            ),
          ),
        );
      },
      title: Text(
        '${data['name']}',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email: ${data['email']}',
            style: const TextStyle(
              color: kColorDarkerGrey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            'Phone: ${data['mobile']}',
            style: const TextStyle(
              color: kColorDarkerGrey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Are you sure to want delete?',
                        ),
                        actions: [
                          CustomButton(
                            title: 'Yes',
                            onTap: () async {
                              await FirebaseFirestore.instance
                                  .collection('database')
                                  .doc(docId)
                                  .delete();
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            title: 'No',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddResumeScreen(
                        docId: docId,
                        task: TaskType.edit,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.edit,
                  color: kColorDarkNavy,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
