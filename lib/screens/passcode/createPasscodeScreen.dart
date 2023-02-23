import 'dart:async';
import 'package:ToDo/model/passcodeModel.dart';
import 'package:ToDo/screens/passcode/passcodeSettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../dbForToDoListHive/passcodeBox.dart';

class CreatePasscodeScreen extends StatefulWidget {
  CreatePasscodeScreen({Key? key}) : super(key: key);

  final _CreatePasscodeScreenState myAppState =
      new _CreatePasscodeScreenState();

  @override
  _CreatePasscodeScreenState createState() => _CreatePasscodeScreenState();

  void showPass(BuildContext context) {
    myAppState.showPasscode(context, opaque: true);
  }
}

class _CreatePasscodeScreenState extends State<CreatePasscodeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;
  var savedPasscode = <PasscodeModel>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            title: Text("Create passcode",
                style: TextStyle(color: Theme.of(context).highlightColor)),
            backgroundColor: Theme.of(context).primaryColor),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Passcode help you protect your data.',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
              Text('Please don\'t forget your passcode',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
              Text('or your data will be lost.',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
              SizedBox(height: 46),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0))),
                  onPressed: () {
                    showPasscode(context, opaque: false);
                  },
                  child: Text('CREATE PASSCODE',
                      style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontSize: 16)))
            ],
          )),
        ));
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

  passcodeEntered(String enteredPasscode) {
    writePasscodeToLocalStorage(enteredPasscode);
    final savedPasscodeInDB = PasscodeBox.getModel().getAt(0)?.text;
    bool isValid = savedPasscodeInDB == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PasscodeSettingsScreen()));
      });
    }
  }

  passcodeCancelled() {
    Navigator.of(context).pop();
  }

  void writePasscodeToLocalStorage(String passcode) async {
    final securityBox = PasscodeBox.getModel();
    final userEnteredPasscode = PasscodeModel(id: DateTime.now()
        .millisecondsSinceEpoch, text: passcode);
    securityBox.add(userEnteredPasscode);
    print(securityBox.values);
    savedPasscode = securityBox.values.toList();
  }
}