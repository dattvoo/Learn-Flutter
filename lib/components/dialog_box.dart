import 'package:flutter/material.dart';
import 'package:learn_flutter/components/ActionButton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      // ignore: sized_box_for_whitespace
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new task:"),
                controller: controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save buttonr
                  ActionButton(text: 'Save', onPressed: onSave),
                  const SizedBox(
                    width: 8,
                  ),
                  // cancel button
                  ActionButton(text: 'Cancel', onPressed: onCancel)
                ],
              )
            ],
          )),
    );
  }
}
