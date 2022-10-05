import 'package:hive/hive.dart';
part 'toDoModelFiltered.g.dart';

@HiveType(typeId: 2)
class ToDoModelFiltered extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String text;
  @HiveField(2)
  bool isDone;

  ToDoModelFiltered({
    required this.id,
    required this.text,
    this.isDone = false,
  });
}