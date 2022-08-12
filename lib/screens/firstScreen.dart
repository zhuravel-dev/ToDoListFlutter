import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var toDoList = [];
  late String _userData;

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
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(toDoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(toDoList[index]),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        toDoList.removeAt(index);
                      });
                    },
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