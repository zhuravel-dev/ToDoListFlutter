import 'dart:async';
import 'package:ToDo/screens/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../db/toDoBox.dart';
import '../model/toDoModel.dart';
import '../widgets/toDoItem.dart';
import 'calendarScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var toDoList = <ToDoModel>[];
  List<ToDoModel> foundToDo = [];
  late String userData;
  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.box('Passcode').close();
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("To Do List", style: TextStyle(color: Theme
              .of(context).highlightColor)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month),
              color: Theme.of(context).iconTheme.color,
              tooltip: 'Open Calendar',
              onPressed: () =>
              {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarScreen()))
              },
            )
          ],
          backgroundColor: Theme.of(context).primaryColor),
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).bottomAppBarColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
                  },
                  color: Theme.of(context).iconTheme.color
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add note"),
                  content: TextField(
                    onChanged: (String value) {
                      userData = value;
                    },
                    decoration: const InputDecoration(hintText: "Write here"),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toDoList.add(ToDoModel(
                            id: DateTime.now().millisecondsSinceEpoch,
                            text: userData,
                          ));
                        });
                        writeDataToLocalStorage(userData);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                      child: Icon(Icons.done, color: Theme.of(context).iconTheme.color),
                    ),
                  ],
                );
              });
        },
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: search(),
          ),
          Container(
              padding: EdgeInsets.only(
                  top: 56.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: ValueListenableBuilder<Box<ToDoModel>>(
                  valueListenable: ToDoBox.getModel().listenable(),
                  builder: (context, box, _) {
                    final item = box.values.toList();
                    return ListView(children: [
                      for (ToDoModel todo in item.reversed)
                        ToDoItem(
                          todo: todo,
                          changeToDo: changeToDo,
                          deleteToDo: deleteToDo,
                        )
                    ]);
                  }
              )
          ),
        ],
      ),
    );
  }

  void listSearch(String enteredData) {
    List<ToDoModel> results = [];
    if (enteredData.isEmpty) {
      results = toDoList;
    } else {
      results = toDoList
          .where((item) =>
          item.text.toLowerCase().contains(enteredData.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  void changeToDo(ToDoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDo(String id) {
    setState(() {
      toDoList.removeWhere((item) => item.id == id);
    });
  }

  Widget search() {
    return Container(
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .primaryColorLight,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          onChanged: (value) => listSearch(value),
          decoration: InputDecoration(
              prefixIcon: Center(
                  child: Icon(Icons.search, color: Theme
                      .of(context)
                      .highlightColor, size: 20)),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 32,
              ),
              border: InputBorder.none,
              hintText: 'Search' ),
        ),
      ),
    );
  }

  void writeDataToLocalStorage(String value) async {
    final box = ToDoBox.getModel();
    final toDoItem = ToDoModel(id: DateTime.now()
        .millisecondsSinceEpoch, text: value);
    box.add(toDoItem);
    print(box.values);
    toDoList = box.values.toList();
  }

}