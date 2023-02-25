import 'package:ToDo/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../dbForRegistrationSQL/SQLiteDB.dart';

String _entered_login = '';
String _entered_password = '';

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

class UsernameInput extends StatefulWidget {
  @override
  _UsernameInputState createState() => _UsernameInputState();

}

class _UsernameInputState extends State<UsernameInput> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .cardTheme
                .color,
            border: Border.all(color: Theme
                .of(context)
                .highlightColor),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            controller: _usernameController,
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (login) => {
              setState(() {
                _entered_login = login;
              }),
            },
            decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Login',
            ),
          ),
        ),
      ),
    );
  }
}


class PasswordInput extends StatefulWidget {

  @override
  _PasswordInputState createState() => _PasswordInputState();

}

class _PasswordInputState extends State<PasswordInput> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .cardTheme
                .color,
            border: Border.all(color: Theme
                .of(context)
                .highlightColor),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            controller: _passwordController,
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) => {
              setState(() {
                _entered_password = password;
              }),
            },
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: SizedBox(
          height: 60, //height of button
          width: double.infinity,
          child: ElevatedButton(
              key: const Key('loginForm_continue_raisedButton'),
              onPressed: () async {
                SQLiteDB().newUser(_entered_login, _entered_password);
                SQLiteDB().openDatabaseAndPrintContent();
                showDialog(context: context, builder: (BuildContext context) =>
                AlertDialog(
                  content: const Text('Registration successful'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen())),
                        child: Text('Go to home screen', style: TextStyle(color: Theme.of(context).primaryColor),))
                  ],
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.all(16),
              ),
              child: Container(
                child: Text('Registration',
                    style: TextStyle(color: Theme
                        .of(context)
                        .highlightColor, fontSize: 16)),
              )
          ),
        )

    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}