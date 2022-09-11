import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_flutter/widgets/appBar.dart';
import 'package:to_do_list_flutter/widgets/toDoItem.dart';
import '../model/toDoModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var toDoList = ToDo.toDoList();
  List<ToDo> foundToDo = [];
  late String userData;

  final _myBox = Hive.box('ToDoApp');

  void writeData(String value) {
    _myBox.put(1, value);
    print(_myBox.get(1));
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
      appBar: MyAppBar(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.green[400],
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
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
                          toDoList.add(ToDo(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            text: userData,
                          ));
                        });
                        writeData(userData);
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
              child: ListView(children: [
                for (ToDo todo in foundToDo.reversed)
                  ToDoItem(
                    todo: todo,
                    changeToDo: changeToDo,
                    deleteToDo: deleteToDo,
                  )
              ])),
        ],
      ),
    );
  }

  void listSearch(String enteredData) {
    List<ToDo> results = [];
    if (enteredData.isEmpty) {
      results = toDoList;
    } else {
      results = toDoList
          .where((item) =>
              item.text!.toLowerCase().contains(enteredData.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  void changeToDo(ToDo todo) {
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
