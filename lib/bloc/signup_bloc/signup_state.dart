

import 'package:atahope/model/signup_model.dart';

abstract class SignupState {}

final class SignupInitialState extends SignupState {}

final class SignupLoadedState extends SignupState {
  final SignUpModel signupModel;

  SignupLoadedState({required this.signupModel});
}

final class SignupFailureState extends SignupState {
  final String? message;

  SignupFailureState(this.message);
}