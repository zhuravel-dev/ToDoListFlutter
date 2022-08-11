import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

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