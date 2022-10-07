import 'package:ToDo/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class PasscodeSettingsScreen extends StatefulWidget {
  const PasscodeSettingsScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PasscodeSettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).highlightColor),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))
          ),
          title: Text("Passcode settings", style: TextStyle(color: Theme
              .of(context).highlightColor)
          ),
        ),
      body: Container(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Theme.of(context).cardTheme.color,
              leading: Icon(Icons.compare_arrows, color: Theme.of(context).primaryColor),
              title: Text(
                "Change passcode",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              onTap: () {},
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Theme.of(context).cardTheme.color,
              leading: Icon(Icons.close, color: Theme.of(context).primaryColor),
              title: Text(
                "Delete passcode",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}