import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../registerScreen/registerScreen.dart';
import 'loginState.dart';
import 'loginBloc.dart';
import 'loginEvent.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hello again!',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                  fontSize: 32),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome back!',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            SizedBox(height: 32),
            _UsernameInput(),
            SizedBox(height: 12),
            _PasswordInput(),
            SizedBox(height: 12),
            _LoginButton(),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
                RichText(text: TextSpan(
                    text: ' Register now',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                }
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.login != current.login,
      builder: (context, state) {
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
                onChanged: (username) =>
                    context.read<LoginBloc>().add(
                        LoginUsernameChanged(username)),
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Login',
                  errorText: state.login.invalid ? 'Login error' : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
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
                onChanged: (password) =>
                    context.read<LoginBloc>().add(
                        LoginPasswordChanged(password)),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: state.password.invalid ? 'Password error' : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: SizedBox(
                height: 60, //height of button
                width: double.infinity,
                child: ElevatedButton(
                    key: const Key('loginForm_continue_raisedButton'),
                    onPressed: () {
                      context.read<LoginBloc>().add(const LoginSubmitted());
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
                      child: Text('Sing in',
                          style: TextStyle(color: Theme
                              .of(context)
                              .highlightColor, fontSize: 16)),
                    )
                ),
              )

          );
        }
    );
  }
}