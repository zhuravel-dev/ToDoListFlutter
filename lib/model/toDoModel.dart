import 'package:hive_flutter/hive_flutter.dart';

part 'toDoModel.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String text;
  @HiveField(2)
  bool isDone;
  @HiveField(3)
  bool isFromSearch;

  ToDoModel({
    required this.id,
    required this.text,
    this.isDone = false,
    this.isFromSearch = false
  });
}