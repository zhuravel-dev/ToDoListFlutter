import 'package:ToDo/main.dart';
import 'package:ToDo/screens/passcode/createPasscodeScreen.dart';
import 'package:ToDo/screens/passcode/passcodeSettingsScreen.dart';
import 'package:flutter/material.dart';
import '../dbForToDoListHive/passcodeBox.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSelected = false;
  final savedPasscodeInDB = PasscodeBox.getModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("To Do List", style: TextStyle(color: Theme
              .of(context)
              .highlightColor)),
          backgroundColor: Theme
              .of(context)
              .primaryColor),
      body: Container(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                showDialog(context: context, builder: (context) =>
                StatefulBuilder(
                    builder: (context, setState) =>
                        AlertDialog(
                          insetPadding: EdgeInsets.symmetric(
                              horizontal: 72, vertical: 220),
                          contentPadding: EdgeInsets.only(top: 16),
                          title: Text('Select theme:'),
                          content: Column(
                            children: [
                              ListTile(
                                  title: Text('Light theme'),
                                  leading: Checkbox(
                                    value: !isSelected,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        if (isSelected = false == newValue!)
                                        ToDoApp.of(context)!.changeTheme(
                                            ThemeMode.dark);
                                        else ToDoApp.of(context)!.changeTheme(
                                            ThemeMode.light);
                                      });
                                    },
                                    checkColor: Theme
                                        .of(context)
                                        .highlightColor,
                                    activeColor: Theme
                                        .of(context)
                                        .primaryColor,
                                  )
                              ),
                              ListTile(
                                  title: Text('Dark theme'),
                                  leading: Checkbox(
                                    value: isSelected,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        if(isSelected = true == newValue!)
                                        ToDoApp.of(context)!.changeTheme(
                                            ThemeMode.dark);
                                        else
                                          ToDoApp.of(context)!.changeTheme(
                                              ThemeMode.light);
                                      });
                                    },
                                    checkColor: Theme
                                        .of(context)
                                        .highlightColor,
                                    activeColor: Theme
                                        .of(context)
                                        .primaryColor,
                                  )
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () =>
                              {
                                Navigator.of(context).pop(),
                              },
                              child: Text('Cancel'),
                              style: ElevatedButton.styleFrom(backgroundColor: Theme
                                  .of(context)
                                  .primaryColor),
                            )
                          ],
                        )
                )
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
                title: Text(
                  "Security",
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5),
                tileColor: Theme
                    .of(context)
                    .cardTheme
                    .color,
                leading: Icon(Icons.security, color: Theme
                    .of(context)
                    .primaryColor),
                onTap: () {
                  if (savedPasscodeInDB.length != 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PasscodeSettingsScreen()));
                  }
                  else { openSetSecurityDialog(); }
                }),
          ],
        ),
      ),
    );
  }

  Future openSetSecurityDialog() =>
      showDialog(
          context: context,
          builder: (context) =>
              StatefulBuilder(
                  builder: (context, setState) =>
                      AlertDialog(content: ListTile(
                        title: Text('Passcode'),
                        trailing: Switch(
                          value: isSelected,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              isSelected = value;
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CreatePasscodeScreen())
                                );
                              }
                              );
                            });
                          },
                        ),
                      ),
                      )
              )
      );
}