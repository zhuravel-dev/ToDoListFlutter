import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loginBloc.dart';
import 'loginForm.dart';

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
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("To Do List", style: TextStyle(color: Theme.of(context).highlightColor),),
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: Center(
            child: BlocProvider(
                create: (context) {
                     return LoginBloc();
                     },
                  child: LoginForm(),
            )
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
