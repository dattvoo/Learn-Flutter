import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  ActionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow[400],
      child: Text(text),
    );
  }
}
