import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/screens/firstScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:to_do_list_flutter/screens/welcomeScreen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MaterialApp(
    home: WelcomeScreen(),
  ));
}