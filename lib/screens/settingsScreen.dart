import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar:AppBar(
          title: const Text("To Do List"),
          backgroundColor: Colors.green),
      body: Container(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Colors.white,
              leading: Icon(Icons.color_lens_outlined, color: Colors.green),
              title: Text(
                "App`s colors",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Colors.white,
              leading: Icon(Icons.security, color: Colors.green),
              title: Text(
                "Security",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}