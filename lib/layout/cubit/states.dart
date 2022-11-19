abstract class HomeState{}

class HomeInitialState extends HomeState{}
class GetUserUpdateLoadingState extends HomeState{}
class GetUserUpdateSuccessState extends HomeState{}
class GetUserUpdateErrorState extends HomeState{
  final String error;

  GetUserUpdateErrorState(this.error);
}
class ChangeNavBarSuccessState extends HomeState{}

class EditProfileChangePasswordVisibilityState extends HomeState{}
class UpdateGenderSuccessState extends HomeState{}
class UserUpdateLoadingState extends HomeState{}