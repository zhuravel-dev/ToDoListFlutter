import 'package:ToDo/screens/loginScreen/passwordValidation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'loginValidation.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.login = const Login.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Login login;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    Login? login,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, login, password];
}