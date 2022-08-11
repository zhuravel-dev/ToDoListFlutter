import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text("To Do List"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "This is first screen",
          style: TextStyle(
              fontSize: 20, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print("Clicked");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
