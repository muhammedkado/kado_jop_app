abstract class SettingStates {}

class SettingInitialState extends SettingStates {}

class NotificationButtonSuccessState extends SettingStates {}

class SignOutSuccessState extends SettingStates {}

class SignOutErrorState extends SettingStates {}

class SignOutLoadingState extends SettingStates {}

class SettingUserUpdateLoadingState extends SettingStates {}

class SettingUserUpdateSuccessState extends SettingStates {}

class SettingUserUpdateErrorState extends SettingStates {
  final Error;
  SettingUserUpdateErrorState(this.Error);
}

class GetUserUpdateLoadingState extends SettingStates {}

class GetUserUpdateSuccessState extends SettingStates {}

class GetUserUpdateErrorState extends SettingStates {
  final String error;

  GetUserUpdateErrorState(this.error);
}

class UserUpdateLoadingState extends SettingStates {}


class LanguageSelectSuccessState extends SettingStates {}
