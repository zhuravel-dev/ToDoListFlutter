import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_flutter/db/ToDoBox.dart';
import 'package:to_do_list_flutter/screens/settingsScreen.dart';
import 'package:to_do_list_flutter/widgets/toDoItem.dart';

import '../model/toDoModel.dart';
import 'calendarScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var toDoList = <ToDoModel>[];
  List<ToDoModel> foundToDo = [];
  late String userData;

  void writeDataToLocalStorage(String value) async {
    final box = ToDoBox.getModel();
    final toDoItem = ToDoModel(id: DateTime.now().millisecondsSinceEpoch, text: value);
    box.add(toDoItem);
    print(box.values);
    toDoList = box.values.toList();
  }
  
  @override
  void initState() {
    foundToDo = toDoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
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
          backgroundColor: Colors.green),
      bottomNavigationBar: BottomAppBar(
          color: Colors.green[300],
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                },
                color: Colors.white,
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
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
                            id: DateTime.now()
                                .millisecondsSinceEpoch,
                            text: userData,
                          ));
                        });
                        writeDataToLocalStorage(userData);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: const Icon(Icons.done),
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
          color: Colors.green[200],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          onChanged: (value) => listSearch(value),
          decoration: InputDecoration(
              prefixIcon: Center(
                  child: Icon(Icons.search, color: Colors.white, size: 20)),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 20,
              ),
              border: InputBorder.none,
              hintText: 'Search'),
        ),
      ),
    );
  }
}
