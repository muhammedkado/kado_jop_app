abstract class MyProjectStates {}
class MyProjectInitialState extends MyProjectStates{}
class MyProjectLoadingState extends MyProjectStates{}
class MyProjectSuccessState extends MyProjectStates{}
class MyProjectErrorState extends MyProjectStates{
  final Error;

  MyProjectErrorState(this.Error);

}