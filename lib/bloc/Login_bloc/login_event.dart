/// login event
sealed class LoginEvent {
  LoginEvent();
}
class OnLoginEvent extends LoginEvent {
  final Map<String, dynamic> params;

  OnLoginEvent({
    required this.params,
  });
}