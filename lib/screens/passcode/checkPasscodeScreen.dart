import 'dart:async';
import 'dart:developer';
import 'package:ToDo/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passcode_screen/passcode_screen.dart';
import '../../dbForToDoListHive/passcodeBox.dart';

class CheckPasscodeScreen extends StatefulWidget {
  CheckPasscodeScreen({Key? key}) : super(key: key);

  @override
  _CheckPasscodeScreenState createState() => _CheckPasscodeScreenState();
}

class _CheckPasscodeScreenState extends State<CheckPasscodeScreen> {
  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();
  bool isAuthenticated = false;

  @override
  void dispose() {
    Hive.box('Passcode').close();
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isPasscodeOn(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("To Do List", style: TextStyle(color: Theme
              .of(context).highlightColor)),
          backgroundColor: Theme.of(context).primaryColor,
      )
    );
  }

  void isPasscodeOn(BuildContext context) async {
    final savedPasscode = PasscodeBox.getModel().values.toList();
    if (savedPasscode.length != 0) {
      showPasscode(context, opaque: true);
    }
    if (savedPasscode.length == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else {
      log('error in isPasscodeOn, checkPasscodeScreen');
    }
    }

  void showPasscode(BuildContext context,
      {required bool opaque, Widget? cancelButton, List<String>? digits}) =>
      Navigator.push(
          context,
          PageRouteBuilder(
              opaque: opaque,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PasscodeScreen(
                    title: Text('Enter you passcode',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 28)),
                    passwordEnteredCallback: passcodeEntered,
                    cancelButton: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).highlightColor),
                        semanticsLabel: 'Cancel',
                      ),
                    ),
                    deleteButton: Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).highlightColor),
                      semanticsLabel: 'Delete',
                    ),
                    shouldTriggerVerification: _verificationNotifier.stream,
                    backgroundColor: Colors.black.withOpacity(0.8),
                    cancelCallback: passcodeCancelled,
                    digits: digits,
                    passwordDigits: 4,
                  )));

  passcodeEntered(String enteredPasscode) async {
    var savedPassInDB = PasscodeBox.getModel().getAt(0)?.text;
    bool isValid = savedPassInDB == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
          });
      });
    }
  }

  passcodeCancelled() {
    Navigator.of(context).pop();
  }
}