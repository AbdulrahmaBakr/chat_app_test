import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class textFieldWidget extends StatelessWidget {
  textFieldWidget({
    super.key,
  });
  TextEditingController controller = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        onSubmitted: (data) {
          messages.add(
            {'message': data},
          );
          controller.clear();
        },
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.send,
            color: Colors.green,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          hintText: 'Type your message here...',
        ),
      ),
    );
  }
}
