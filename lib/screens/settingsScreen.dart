import 'package:ToDo/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar:AppBar(
          title: Text("To Do List", style: TextStyle(color: Theme
              .of(context).highlightColor)),
          backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 72, vertical: 220),
                        contentPadding: EdgeInsets.only(top: 16),
                        title: Text('Select theme:'),
                        content: Column(
                          children: [
                            ListTile(
                              title: Text('Light theme'),
                              leading: Checkbox(
                                value: isSelected,
                                onChanged: (bool? changeValue) {
                                  setState(() {
                                    isSelected = changeValue!;
                                    ToDoApp.of(context)!.changeTheme(ThemeMode.light);
                                  });
                                },
                                checkColor: Theme.of(context).highlightColor,
                                activeColor: Theme.of(context).primaryColor,
                              )
                            ),
                            ListTile(
                                title: Text('Dark theme'),
                                leading: Checkbox(
                                  value: !isSelected,
                                  onChanged: (bool? changeValue) {
                                    setState(() {
                                      isSelected = false == changeValue!;
                                      ToDoApp.of(context)!.changeTheme(ThemeMode.dark);
                                    });
                                  },
                                  checkColor: Theme.of(context).highlightColor,
                                  activeColor: Theme.of(context).primaryColor,
                                )
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.of(context).pop(),
                            },
                            child: Text('Cancel'),
                            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                          )
                        ],
                      );
                  }
                  );
                },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Theme.of(context).cardTheme.color,
              leading: Icon(Icons.color_lens_outlined, color: Theme.of(context).primaryColor),
              title: Text(
                "App`s colors",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Theme.of(context).cardTheme.color,
              leading: Icon(Icons.security, color: Theme.of(context).primaryColor),
              title: Text(
                "Security",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}