import 'package:ToDo/screens/calendarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  testWidgets('CalendarScreen should build', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalendarScreen()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('To Do List'), findsOneWidget);
    expect(find.byType(TableCalendar), findsOneWidget);
  });
}