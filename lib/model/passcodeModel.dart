import 'package:hive/hive.dart';

part 'passcodeModel.g.dart';

@HiveType(typeId: 1)
class PasscodeModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String text;

    PasscodeModel({
      required this.id,
      required this.text
    });
}

