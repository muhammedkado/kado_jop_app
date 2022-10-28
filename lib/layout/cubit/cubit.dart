import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/user_model.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/modules/contact/contact_screen.dart';
import 'package:kadojopapp/modules/home/home_screen.dart';
import 'package:kadojopapp/modules/project/project_screen.dart';
import 'package:kadojopapp/modules/setting/setting_screen.dart';
import 'package:kadojopapp/shard/components/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    home_screen(),
    Project_Screen(),
    Contact_Screen(),
    Setting_Screen(),
  ];
  List<String> title = [
    'Home',
    'Available Project',
    'F.A.Q',
    'Setting',
  ];
  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarSuccessState());
  }

  UserModel? model;
  void getUserData() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('user').doc(uId).get().then((value)
    {
      print(value.data());
      model=UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(GetUserErrorState(Error.toString()));
    });
  }
}
