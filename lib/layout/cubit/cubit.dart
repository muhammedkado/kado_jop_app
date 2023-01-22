import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/modules/myproject/myproject_screen.dart';
import 'package:kadojopapp/modules/new_project/newproject_screen.dart';
 import 'package:kadojopapp/modules/setting/setting_screen.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    NewProject_Screen(),
    MyProject_Screen(),
    Setting_Screen(),
  ];
  List<String> title = [
    'Search Project',
    'My Project',
    // 'F.A.Q',
    'Setting',
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarSuccessState());
  }

/*
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(EditProfileChangePasswordVisibilityState());
  }
*/
  var gender;

  genderDropdown(value) {
    gender = value.toString();
    emit(UpdateGenderSuccessState());
  }

  bool isDark = true;

  void changeAppMod({required bool index, bool? shereed}) {
    if (shereed != null) {
      isDark = shereed;
      emit(IsDarkButtonSuccessState());
    }else{
      isDark = index;
      CachHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(IsDarkButtonSuccessState());
      }).catchError((onError) {
        print(onError.toString());
      });
    }

  }
}
