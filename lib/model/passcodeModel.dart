import 'package:hive/hive.dart';
part 'passcodeModel.g.dart';

@HiveType(typeId: 1)
class PasscodeModel extends HiveObject {
  @HiveField(0)
  String passcode;

    PasscodeModel({
      required this.passcode,
    });
}

