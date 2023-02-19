import 'package:formz/formz.dart';

enum LoginValidationError { empty }

class Login extends FormzInput<String, LoginValidationError> {
  const Login.pure() : super.pure('');
  const Login.dirty([super.value = '']) : super.dirty();

  @override
  LoginValidationError? validator(String value) {
    if (value.isEmpty) return LoginValidationError.empty;
    return null;
  }
}