import 'package:ToDo/model/passcodeModel.dart';
import 'package:hive/hive.dart';

class PasscodeBox {
  static Box<PasscodeModel> getModel() =>
      Hive.box<PasscodeModel>("Passcode");
}