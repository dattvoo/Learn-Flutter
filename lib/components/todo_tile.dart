import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            // Wrap the onChanged callback with a new function
            if (onChanged != null) {
              onChanged!(taskComplete); // Pass the current value to onChanged
            }
          },
          child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Checkbox(
                    value: taskComplete,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                        decoration: taskComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
