/// SignUP event
sealed class SignupEvent {
  SignupEvent();
}

class OnSignupEvent extends SignupEvent {
  final Map<String, dynamic> params;
  final Map<String, dynamic>? userDetails;

  OnSignupEvent({
    required this.params,
    this.userDetails,
  });
}