import 'package:ToDo/screens/introScreens/introPage1.dart';
import 'package:ToDo/screens/introScreens/introPage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  testWidgets('PageView displays IntroPage1 and IntroPage2',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PageView(
            children: [
              IntroPage1(),
              IntroPage2(),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(IntroPage1), findsOneWidget);
    expect(find.byType(IntroPage2), findsNothing);

    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.byType(IntroPage1), findsNothing);
    expect(find.byType(IntroPage2), findsOneWidget);
  });

    group('SmoothPageIndicator', () {
    testWidgets(
        'Renders the correct number of dots', (WidgetTester tester) async {
      // Set up the SmoothPageIndicator widget
      final pageController = PageController(initialPage: 0);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    IntroPage1(),
                    IntroPage2(),
                  ],
                ),
                Container(
                  alignment: Alignment(0, 0.75),
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 2,
                    effect: const SlideEffect(
                      activeDotColor: Colors.green,
                      dotHeight: 10,
                      dotColor: Colors.black26,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      );

      // Verify that the AnimatedSmoothIndicator widget displays two dots
      expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(IndicatorEffect), findsOneWidget);
      expect(find.byType(Material), findsNWidgets(2));


      // Verify that the dots have the correct color and size
      final activeDot = find.byWidgetPredicate((widget) => widget is Container && widget.child is Icon && widget.color == Colors.green);
      final inactiveDot = find.byIcon(Icons.circle_outlined);
      expect(activeDot, findsOneWidget);
      expect(inactiveDot, findsOneWidget);
      expect(tester.getSize(activeDot), equals(const Size(10, 10)));
      expect(tester.getSize(inactiveDot), equals(const Size(10, 10)));
    });

    testWidgets(
        'Active dot changes with page controller', (WidgetTester tester) async {
      // Set up the SmoothPageIndicator widget
      final pageController = PageController(initialPage: 0);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    IntroPage1(),
                    IntroPage2(),
                  ],
                ),
                Container(
                  alignment: Alignment(0, 0.75),
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 2,
                    effect: const SlideEffect(
                      activeDotColor: Colors.green,
                      dotHeight: 10,
                      dotColor: Colors.black26,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Verify that the initial active dot is the first one
      expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
      expect(find.byType(Material), findsNWidgets(2));
      expect(find.byIcon(Icons.circle), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget);

      // Move to the second page
      await pageController.animateToPage(
          1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      await tester.pumpAndSettle();

      // Verify that the active dot has changed to the second one
      expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
      expect(find.byType(Material), findsNWidgets(2));
      expect(find.byIcon(Icons.circle), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
    });
  });
}

