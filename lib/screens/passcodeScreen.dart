import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';


class ConfigurePasscodeScreen extends StatefulWidget {
  const ConfigurePasscodeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ConfigurePasscodeScreen> {
  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();
  bool isAuthenticated = false;

/*  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Passcode", style: TextStyle(color: Theme
              .of(context).highlightColor)
          ),
        ),
      body: Stack(
        children: [
        _passcode(context, opaque: false)
        ],
      ),
    );
  }

  _passcode(BuildContext context,
      { required bool opaque,
        CircleUIConfig? circleUIConfig,
        KeyboardUIConfig? keyboardUIConfig,
        Widget? cancelButton,
        List<String>? digits } ) =>
      Navigator.push(context, PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) => PasscodeScreen(
            title: Text('Enter you passcode',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).highlightColor, fontSize: 28)),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _passcodeEntered,
            cancelButton: Text(
              'Cancel',
              style: TextStyle(fontSize: 16, color: Theme.of(context).highlightColor),
              semanticsLabel: 'Cancel',
            ),
            deleteButton: Text(
              'Delete',
              style: TextStyle(fontSize: 16, color: Theme.of(context).highlightColor),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _passcodeCancelled,
            digits: digits,
            passwordDigits: 4,
          )
      )
      );


  _passcodeEntered(String enteredPasscode) {
    bool isValid = true == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _passcodeCancelled() {
    Navigator.maybePop(context);
  }


}
