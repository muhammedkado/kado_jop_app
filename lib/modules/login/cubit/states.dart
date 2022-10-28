abstract class LoginState {}
class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final String? uid;

  LoginSuccessState(this.uid);
}
class LoginErrorState extends LoginState{
  final String Error;

  LoginErrorState(this.Error);
}
class LoginChangePasswordVisibilityState extends LoginState{}


