import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authorizationBloc.dart';
import 'authorizationForm.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Authorization", style: TextStyle(color: Theme.of(context).highlightColor),),
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

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
