import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var toDoList = [];
  late String _userData;

  final _myBox = Hive.box('ToDoApp');

  void writeData(String value) {
        _myBox.put(1, value);
        print(_myBox.get(1));
  }

  @override
  void initState() {
    super.initState();
    toDoList.addAll([
      "Купить бабуле подарок на др",
      "Прочесть 10 страниц Капитала",
      "Тренировка в черверг в парке"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text("To Do List"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(toDoList[index]),
              onDismissed: (DismissDirection direction){
                setState(() {
                  toDoList.removeAt(index);
                });
              },
              child: Card(
                child: ListTile(
                  title: Text(toDoList[index]),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
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
                      _userData = value;
                      writeData(value);
                    },
                    decoration: const InputDecoration(hintText: "Write here"),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toDoList.add(_userData);
                        });
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: const Icon(Icons.done),
                    ),
                  ],
                );
              }
             );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}