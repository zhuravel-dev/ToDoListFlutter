import 'package:flutter/material.dart';
import '../screens/calendarScreen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month),
              tooltip: 'Open Calendar',
              onPressed: () =>
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarScreen()))
              },
            )
          ],
          backgroundColor: Colors.green)
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}