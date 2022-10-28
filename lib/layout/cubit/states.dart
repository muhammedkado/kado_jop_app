abstract class HomeState{}

class HomeInitialState extends HomeState{}
class GetUserLoadingState extends HomeState{}
class GetUserSuccessState extends HomeState{}
class GetUserErrorState extends HomeState{
  final String error;

  GetUserErrorState(this.error);
}
class ChangeNavBarSuccessState extends HomeState{}