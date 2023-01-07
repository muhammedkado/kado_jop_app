abstract class SettingStates {}

class SettingInitialState extends SettingStates {}

class NotificationButtonSuccessState extends SettingStates {}
class IsDarkButtonSuccessState extends SettingStates {}

class SignOutSuccessState extends SettingStates {}

class SignOutErrorState extends SettingStates {}

class SignOutLoadingState extends SettingStates {}

class SettingUserUpdateLoadingState extends SettingStates {}

class SettingUserUpdateSuccessState extends SettingStates {}

class SettingUserUpdateErrorState extends SettingStates {
  final Error;
  SettingUserUpdateErrorState(this.Error);
}





class UserUpdateLoadingState extends SettingStates {}

class UserUpdateSuccessState extends SettingStates {}

class UserUpdateErrorState extends SettingStates {
  final String error;

  UserUpdateErrorState(this.error);
}

class LanguageSelectSuccessState extends SettingStates {}
