import 'package:atahope/bloc/otp_verify_bloc/verify_otp_event.dart';
import 'package:atahope/bloc/otp_verify_bloc/verify_otp_state.dart';
import 'package:atahope/common/common_function.dart';
import 'package:atahope/model/otp_verify_model.dart';
import 'package:atahope/view_screen/auth_repo.dart';
import 'package:atahope/view_screen/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;


class OTPVerifyBloc extends Bloc<VerifyOTPEvent, OTPVerifyState> {
  final AuthRepo _authRepo = AuthRepo();

  OTPVerifyBloc() : super(OTPVerifyInitialState()) {
    on<OnVerifyOTPRequestEvent>((event, emit) async {
      emit(OTPVerifyInitialState());
      try {
        EasyLoading.show();
        OtpValidateModel otpVerifyData = await _authRepo.verifyOTP(event.params);
        if (otpVerifyData.msg == "OTP Validate Succesfully") {
          showToastMessage(ctx!, true, otpVerifyData.msg.toString());
          EasyLoading.dismiss();
          Navigator.push(
            ctx!,
            MaterialPageRoute<void>(
              builder: (context) => const LoginOnboardingScreen(),
            ),
          );
          emit(OTPVerifyLoadedState(otpVerifyData: otpVerifyData));
        } else {
          EasyLoading.dismiss();
          // showToastMessage(globalContext, false, otpVerifyData.msg);
          emit(OTPVerifyFailureState(otpVerifyData.msg));
        }
      } catch (e) {
        EasyLoading.dismiss();
        emit(OTPVerifyFailureState("error: $e"));
      }
    });
  }
}