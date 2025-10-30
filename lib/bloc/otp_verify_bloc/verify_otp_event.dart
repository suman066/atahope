sealed class VerifyOTPEvent {
  VerifyOTPEvent();
}

class OnVerifyOTPRequestEvent extends VerifyOTPEvent {
  final Map<String, dynamic> params;
  final bool? isSignup;

  OnVerifyOTPRequestEvent({
    required this.params,
    required this.isSignup,
  });
}