abstract class JoinProjectStates {}
class JoinProjectIniltionState extends JoinProjectStates{}
class JoinProjectLoading extends JoinProjectStates{}
class CurrentStepState extends JoinProjectStates{}
class JoinProjectError extends JoinProjectStates{}
class JoinProjectLoadingState extends JoinProjectStates{}
class JoinProjectSuccessState extends JoinProjectStates{}
class JoinProjectErrorState extends JoinProjectStates{
  final Error;

  JoinProjectErrorState(this.Error);
}

class TermsCheckBoxState extends JoinProjectStates{}
class Terms2CheckBoxState extends JoinProjectStates{}