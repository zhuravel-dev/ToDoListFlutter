import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_flutter/screens/homeScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:to_do_list_flutter/screens/onBoardingScreen.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('ToDoApp');

  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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