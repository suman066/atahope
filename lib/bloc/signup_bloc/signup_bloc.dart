import 'package:atahope/bloc/signup_bloc/signup_event.dart';
import 'package:atahope/bloc/signup_bloc/signup_state.dart';
import 'package:atahope/view_screen/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/common_function.dart';
import '../../model/signup_model.dart';
import '../../view_screen/auth_repo.dart';


class SignupBloc extends Bloc<SignupEvent,SignupState> {
  final AuthRepo _authRepo = AuthRepo();
  SignupBloc() : super(SignupInitialState()) {
    on<OnSignupEvent>((event, emit) async {
      emit(SignupInitialState());
      try {
        EasyLoading.show();
        SignUpModel data = await _authRepo.doSignup(event.params);
        if (data.msg == "Data Created Succesfully" || data.msg == "Duplicate Email, New OTP send") {
          EasyLoading.dismiss();
          showToastMessage(ctx!, true, data.msg.toString());
          if (data.data != null) {
            Navigator.push(
              ctx!,
              MaterialPageRoute<void>(
                builder: (context) => const OTPOnboardingScreen(),
              ),
            );
            Map<String, dynamic> userdata=data.data!.toJson();
            await setUserDetails(userdata);
          }

          await setHeaderData(token:"",newToken:data.data?.uEmail ,userId:data.data?.uPass.toString());
          emit(SignupLoadedState(signupModel: data));
        }
        else {
          EasyLoading.dismiss();
          emit(SignupFailureState(data.msg));
        }
      } catch (e) {
        EasyLoading.dismiss();
        emit(SignupFailureState("error: $e"));
      }
    });
  }
}