import 'package:hive/hive.dart';
import 'package:to_do_list_flutter/model/toDoModel.dart';

class ToDoBox {
  static Box<ToDoModel> getModel() =>
  Hive.box<ToDoModel>("ToDoApp");
}