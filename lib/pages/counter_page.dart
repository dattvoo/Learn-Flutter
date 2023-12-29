// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  // variables
  int _counter = 0;
  // Method
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        return;
      }
      _counter--;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Message
        Text("You pushed the button this many time:"),
        // counter value
        Text(
          _counter.toString(),
          style: TextStyle(fontSize: 40),
        ),
        // button
        Wrap(
          spacing: 20,
          children: [
            ElevatedButton(
                onPressed: _incrementCounter, child: Text('Increment')),
            ElevatedButton(
                onPressed: _decrementCounter, child: Text('Decrement'))
          ],
        )
      ],
    )));
  }
}
