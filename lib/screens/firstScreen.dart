import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var toDoList = [];

  @override
  void initState() {
    super.initState();
    toDoList.addAll([
      "Покормить кошку",
      "Прочесть 10 страниц Капитала",
      "Тренировка в черверг"
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
          print("Clicked");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
