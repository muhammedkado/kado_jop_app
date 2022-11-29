abstract class ContactState {}
class ContactInitialState extends ContactState{}
class MessageSaveSuccessesState extends ContactState{}
class MessageSaveLoadingState extends ContactState{}
class MessageSaveErrorState extends ContactState{
  final Error;

  MessageSaveErrorState(this.Error);
}