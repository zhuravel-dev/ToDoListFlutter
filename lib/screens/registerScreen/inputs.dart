import 'package:flutter/material.dart';


class UsernameInput extends StatelessWidget {
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
                key: const Key('loginForm_usernameInput_textField'),
                onChanged: (username) => {},
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Login',
                ),
              ),
            ),
          ),
        );
      }
  }


class PasswordInput extends StatelessWidget {
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
                key: const Key('loginForm_passwordInput_textField'),
                onChanged: (password) => {},
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
          ),
        );
      }
  }