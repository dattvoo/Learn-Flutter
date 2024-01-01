// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter/pages/todo_page.dart';

void main() async {
  // init a hive
  await Hive.initFlutter();
  await Hive.openBox("todobox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: TodoPage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//   // final String title;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: Center(
//             child: Text(
//           "My App",
//           style: TextStyle(color: Colors.white54),
//         )),
//         backgroundColor: Colors.deepPurple,
//         elevation: 8,
//         leading: Icon(Icons.menu),
//         actions: [
//           IconButton(
//             onPressed: () {
//               print('hihi');
//             },
//             icon: Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Center(
//         child: Container(
//             width: 200,
//             height: 200,
//             padding: EdgeInsets.all(25),
//             decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(20)),
//             child: Icon(
//               Icons.favorite,
//               color: Colors.white,
//               size: 64,
//             )),
//       ),
//     ));
//   }
// }
