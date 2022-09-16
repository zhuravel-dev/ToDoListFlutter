import 'package:hive/hive.dart';
import '../model/toDoModel.dart';

class HiveAdapterForToDo extends TypeAdapter<ToDo>{

  @override
  final typeId = 0;

  @override
  ToDo read(BinaryReader reader) {
   final id = reader.readInt();
   final text = reader.readString();
   final isDone = reader.readBool();
   return ToDo(id: id, text: text, isDone: isDone);
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.text);
    writer.writeBool(obj.isDone);
  }

}