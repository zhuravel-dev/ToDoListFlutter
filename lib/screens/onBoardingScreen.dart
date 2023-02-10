import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'introScreens/introPage1.dart';
import 'introScreens/introPage2.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 0));
    FlutterNativeSplash.remove();
  }

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
             IntroPage1(),
              IntroPage2()
            ],
          ),

          Container(
           alignment: Alignment(0, 0.75),
            child:
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: const SlideEffect(
                    activeDotColor: Colors.green,
                    dotHeight: 10,
                    dotColor: Colors.black26,
                    dotWidth: 10,
                  ),
                ),
            )
        ],
      ),
    );
  }
}