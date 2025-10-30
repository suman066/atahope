import 'package:atahope/bloc/Login_bloc/login_event.dart';
import 'package:atahope/bloc/Login_bloc/login_state.dart';
import 'package:atahope/common/common_function.dart';
import 'package:atahope/model/login_model.dart';
import 'package:atahope/view_screen/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo = AuthRepo();
  LoginBloc() : super(LoginInitialState()) {
    on<OnLoginEvent>((event, emit) async {
      emit(LoginInitialState());
      try {
        EasyLoading.show();
        LoginModel loginModel = await _authRepo.doLogin(event.params);
        if (loginModel.success == true) {
          EasyLoading.dismiss();
          emit(LoginLoadedState(loginDataModel: loginModel));
        } else {
          EasyLoading.dismiss();
          showToastMessage(ctx!, false, loginModel.msg);
          emit(LoginFailureState(loginModel.msg));
        }
      } catch (e) {
        EasyLoading.dismiss();
        print("error: $e");
        emit(LoginFailureState("error: $e"));
      }
    });
  }


}
