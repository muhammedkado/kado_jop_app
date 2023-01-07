abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErorrState extends RegisterStates {
  final String erorr;
  RegisterErorrState(this.erorr);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}

class CreateLoadingState extends RegisterStates {}

class CreateSuccessState extends RegisterStates {
  //final String Uid;
  //CreateSuccessState(this.Uid);
}

class CreateErorrState extends RegisterStates {
  final String Error;
  CreateErorrState(this.Error);
}


class GenderSuccessState extends RegisterStates {}
class CountrySuccessState extends RegisterStates {}
class CheckBoxState extends RegisterStates {}
