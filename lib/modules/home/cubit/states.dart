abstract class NewProjectStates {}

class NewProjectInitialState extends NewProjectStates{}
class GetNewProjectLoadingState extends NewProjectStates{}
class GetNewProjectSuccessState extends NewProjectStates{}
class GetNewProjectErrorState extends NewProjectStates{
  final Error;

  GetNewProjectErrorState(this.Error);

}

