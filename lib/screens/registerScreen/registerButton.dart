import 'package:flutter/material.dart';

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
                  onPressed: () {

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