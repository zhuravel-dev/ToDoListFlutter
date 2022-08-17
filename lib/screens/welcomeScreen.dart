import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:to_do_list_flutter/screens/loginScreen.dart';
import 'package:to_do_list_flutter/screens/firstScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 0));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/productivity.jpg",
                width: 360, height: 360),
            Text(
              "BE MORE PRODUCTIVE WITH TODO!",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[500],
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text('Continue with authorization')),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[500],
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstScreen()));
                },
                child: Text('Continue without authorization')),
          ],
        ),
      ),
    );
  }
}
