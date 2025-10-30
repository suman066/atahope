

import 'package:atahope/model/login_model.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadedState extends LoginState {
  final LoginModel loginDataModel;

  LoginLoadedState({required this.loginDataModel});
}

final class LoginFailureState extends LoginState {
  final String? message;

  LoginFailureState(this.message);
}
