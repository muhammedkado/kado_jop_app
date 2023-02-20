abstract class AdminState {}

class AdminInitialState extends AdminState{}
class JobRolDropDownSuccessState extends AdminState{}
class jobTypeDropDownSuccessState extends AdminState{}
class SetProjectLoadingState extends AdminState{}
class SetProjectSuccessState extends AdminState{}
class SetProjectErrorState extends AdminState{}

class UpdateProjectLoadingState extends AdminState{}
class UpdateProjectSuccessState extends AdminState{}
class UpdateProjectErrorState extends AdminState{}

class GetProjectLoadingState extends AdminState{}
class GetProjectSuccessState extends AdminState{}
class GetProjectErrorState extends AdminState{
  final String Error;
  GetProjectErrorState(this.Error);
}

class DeleteProjectLoadingState extends AdminState{}
class DeleteProjectSuccessState extends AdminState{}
class DeleteProjectErrorState extends AdminState{
  final String Error;
  DeleteProjectErrorState(this.Error);
}

class GetMessagesLoadingState extends AdminState{}
class GetMessagesSuccessState extends AdminState{}
class GetMessagesErrorState extends AdminState{
  final String Error;
  GetMessagesErrorState(this.Error);
}
class getProjectMemberLoadingState extends AdminState{}
class getProjectMemberSuccessState extends AdminState{}
class getProjectMemberErrorState extends AdminState{
  final String Error;
  getProjectMemberErrorState(this.Error);
}
class getMemberLoadingState extends AdminState{}
class getMemberSuccessState extends AdminState{}
class getMemberErrorState extends AdminState{
  final String Error;
  getMemberErrorState(this.Error);
}
