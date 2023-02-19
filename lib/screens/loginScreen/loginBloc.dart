import 'package:ToDo/screens/loginScreen/passwordValidation.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'loginState.dart';
import 'loginEvent.dart';
import 'loginValidation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  void _onUsernameChanged(
      LoginUsernameChanged event,
      Emitter<LoginState> emit,
      ) {
    final login = Login.dirty(event.username);
    emit(
      state.copyWith(
        login: login,
        status: Formz.validate([state.password, login]),
      ),
    );
  }

  void _onPasswordChanged(
      LoginPasswordChanged event,
      Emitter<LoginState> emit,
      ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.login]),
      ),
    );
  }

}