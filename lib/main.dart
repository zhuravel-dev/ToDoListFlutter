import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/screens/firstScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:to_do_list_flutter/screens/onBoardingScreen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(
    scrollBehavior: AppScrollBehavior(),
    home: OnBoardingScreen(),
  ));
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}