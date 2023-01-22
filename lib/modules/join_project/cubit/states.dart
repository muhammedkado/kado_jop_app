abstract class JoinProjectStates {}

class JoinProjectIniltionState extends JoinProjectStates {}

class JoinProjectLoading extends JoinProjectStates {}

class CurrentStepState extends JoinProjectStates {}

class JoinProjectError extends JoinProjectStates {}

class JoinProjectLoadingState extends JoinProjectStates {}

class JoinProjectSuccessState extends JoinProjectStates {}

class JoinProjectErrorState extends JoinProjectStates {
  final Error;

  JoinProjectErrorState(this.Error);
}

class TermsCheckBoxState extends JoinProjectStates {}

class Terms2CheckBoxState extends JoinProjectStates {}

class GetUserInfoLoadingState extends JoinProjectStates {}

class GetUserInfoSuccessState extends JoinProjectStates {}

class GetUserInfoErrorState extends JoinProjectStates {
  final Error;

  GetUserInfoErrorState(this.Error);
}

class SetMyProjectLadingState extends JoinProjectStates {}

class SetMyProjectSuccessState extends JoinProjectStates {}

class SetMyProjectErrorState extends JoinProjectStates {
  final Error;

  SetMyProjectErrorState(this.Error);
}

class MyProjectLadingState extends JoinProjectStates {}
class MyProjectSuccessState extends JoinProjectStates {}
class MyProjectErrorState extends JoinProjectStates {
  final Error;

  MyProjectErrorState(this.Error);
}


class SetMemberToProjectLadingState extends JoinProjectStates {}
class SetMemberToProjectSuccessState extends JoinProjectStates {}
class SetMemberToProjectErrorState extends JoinProjectStates {
  final Error;

  SetMemberToProjectErrorState(this.Error);
}

class getUserApplyProjectLadingState extends JoinProjectStates {}
class getUserApplyProjectSuccessState extends JoinProjectStates {}
class getUserApplyProjectErrorState extends JoinProjectStates {
  final Error;

  getUserApplyProjectErrorState(this.Error);
}