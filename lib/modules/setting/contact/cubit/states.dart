abstract class ContactState {}
class ContactInitialState extends ContactState{}
class MassageSaveSuccessesState extends ContactState{}
class MassageSaveLoadingState extends ContactState{}
class MassageSaveErrorState extends ContactState{
  final Error;

  MassageSaveErrorState(this.Error);
}