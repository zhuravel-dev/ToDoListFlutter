import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello again!', style: /*GoogleFonts.bebasNeue(fontSize: 32)*/
              TextStyle(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 32),),
            SizedBox(height: 10),
            Text('Welcome back!', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                        decoration: InputDecoration(border: InputBorder.none, hintText: 'Email'),
                      ),
                  ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(border: InputBorder.none, hintText: 'Password'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('Sing in', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
            ),
            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                Text(' Register now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
              ],
            )



          ],
        ),)
        ,)
    );
  }


  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}