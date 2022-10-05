import 'package:hive/hive.dart';
import '../model/toDoModel.dart';
import '../model/toDoModelFiltered.dart';

class ToDoBox {
  static Box<ToDoModel> getModel() => Hive.box<ToDoModel>("ToDoApp");
  static Box<ToDoModelFiltered> getModelFiltered() => Hive.box<ToDoModelFiltered>("ToDoAppF");
}