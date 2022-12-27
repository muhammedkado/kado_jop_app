import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/modules/home/newproject_screen.dart';
import 'package:kadojopapp/modules/project/project_screen.dart';
import 'package:kadojopapp/modules/setting/setting_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    NewProject_Screen(),
    Project_Screen(),
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


}
