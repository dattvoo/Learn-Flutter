import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My app bar")),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(children: [
          const DrawerHeader(
            child: Icon(
              Icons.favorite,
              size: 48,
            ),
          ),
          // Home page list title
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("H O M E"),
              onTap: () {
                // Turn off drawer bar before redirect another page
                Navigator.pop(context);
                Navigator.pushNamed(context, '/secondpage');
              }),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("S e t t i n g"),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("H O M E"),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text("Go To Page 2"),
        onPressed: () {
          // navigate to pgae 2
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const SecondPage()));
          Navigator.pushNamed(context, '/secondpage');
        },
      )),
    );
  }
}
