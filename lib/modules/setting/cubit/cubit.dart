import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  bool isOff = false;
  void changeNotification(index) {
    isOff = index;
    emit(NotificationButtonSuccessState());
  }

  void signOut(
  {
  required context,
  required Widget screen,
}
      ){
    emit(SignOutLoadingState());
    CachHelper.removeData(key: 'uId').then((value)
    {
      NavigatorAndFinish(context: context, Widget: screen);
      emit(SignOutSuccessState());

    }).catchError((onError){
      print(onError.toString());
      emit(SignOutErrorState());
    });
  }



}
