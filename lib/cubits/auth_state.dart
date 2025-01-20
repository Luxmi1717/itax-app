abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthOTPSentSuccess extends AuthState {

  String type = '';

  AuthOTPSentSuccess({ this.type= 'verification' });

}

class AuthOTPVerificationPending extends AuthState {}
class AuthPasswordResetPending extends AuthState {}

class AuthSuccess extends AuthState {
  bool loggedIn = false;
  final bool fogotPassword;
  final bool changedPassword;
  AuthSuccess({
    required this.loggedIn,
    this.fogotPassword = false,
    this.changedPassword = false,
  });
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
class AuthProfileUpdating extends AuthState {}

class AuthProfileError extends AuthState {
  final String message;
  AuthProfileError({required this.message});
}

class AuthProfileUpdateSuccess extends AuthState {

}
class AuthbussinessProfileSuccess extends AuthState{

}


