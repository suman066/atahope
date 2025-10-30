

import 'package:atahope/model/otp_verify_model.dart';

abstract class OTPVerifyState {}

final class OTPVerifyInitialState extends OTPVerifyState {}

final class OTPVerifyLoadedState extends OTPVerifyState {
  final OtpValidateModel otpVerifyData;
  OTPVerifyLoadedState({required this.otpVerifyData});
}

final class OTPVerifyFailureState extends OTPVerifyState {
  final String? message;
  OTPVerifyFailureState(this.message);
}