import 'package:hive/hive.dart';
import '../model/toDoModel.dart';

class ToDoBox {
  static Box<ToDoModel> getModel() => Hive.box<ToDoModel>("ToDoApp");
}