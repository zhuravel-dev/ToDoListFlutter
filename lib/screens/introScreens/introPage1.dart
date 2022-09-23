import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO APP!",
              style: TextStyle(color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            Image.asset("assets/images/productivity.jpg",
                width: 260, height: 260),
            Text(
              "BE MORE PRODUCTIVE WITH TODO!",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}