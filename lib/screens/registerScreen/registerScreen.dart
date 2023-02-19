import 'package:ToDo/screens/registerScreen/registerButton.dart';
import 'package:flutter/material.dart';
import 'inputs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(color: Theme.of(context).highlightColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: Align(
              alignment: const Alignment(0, -1 / 3),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Please, enter you personal data',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 24),
                ),
                SizedBox(height: 16),
                UsernameInput(),
                SizedBox(height: 32),
                PasswordInput(),
                SizedBox(height: 16),
                RegisterButton()
              ]))),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
