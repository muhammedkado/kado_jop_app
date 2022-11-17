import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  bool isOff = false;
  void changeNotification(index) {
    isOff = index;
    emit(NotificationButtonSuccessState());
  }




}
