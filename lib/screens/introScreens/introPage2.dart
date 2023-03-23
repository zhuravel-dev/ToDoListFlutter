import 'package:ToDo/screens/authorizationScreen/authorizationScreen.dart';
import 'package:ToDo/screens/passcode/checkPasscodeScreen.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).highlightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding:
                    EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthorizationScreen()));
                },
                child: Text('CONTINUE WITH AUTHORIZATION', style: TextStyle(color:  Theme.of(context).highlightColor, fontSize: 16))),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(
                key: Key('continue_without_auth_button'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Theme.of(context).primaryColor,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckPasscodeScreen()));
                },
                child: Text('CONTINUE WITHOUT AUTHORIZATION', style: TextStyle(color:  Theme.of(context).highlightColor, fontSize: 16))),
          ],
        ),
      ),
    );
  }
}