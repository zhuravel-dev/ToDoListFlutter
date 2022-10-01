import 'dart:async';
import 'package:ToDo/screens/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passcode_screen/passcode_screen.dart';
import '../../db/passcodeBox.dart';
import '../homeScreen.dart';

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
          title: Text("Check passcode", style: TextStyle(color: Theme
              .of(context).highlightColor)),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.settings),
              onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()))
              },
          ),
      )
    );
  }

  void isPasscodeOn(BuildContext context) async {
    final securityBox = PasscodeBox.getModel();
    if (securityBox.getAt(0) != null) {
      showPasscode(context, opaque: true);
    } else
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
    //var savedPassInDB = PasscodeBox.getModel().getAt(0);
    bool isValid = enteredPasscode == enteredPasscode;
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