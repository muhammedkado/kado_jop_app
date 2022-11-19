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

  UserModel? userModel;

  void getUserData() async {
    emit(GetUserUpdateLoadingState());

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      print('Value data${value.data()}');
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      print('Uid data${userModel!.uId}');
      emit(GetUserUpdateSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetUserUpdateErrorState(Error.toString()));
    });
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

  void userUpdate({
    required String email,
    required String name,
    required String phone,
    required String brithDay,
    String? gender,
    String? uId,
    String? country,
  }) async {
    emit(UserUpdateLoadingState());
    UserModel model = UserModel(
        name: name,
        email: email,
        phone: phone,
        brithDay: brithDay,
        country: userModel!.country,
        gender: userModel!.gender,
        uId: userModel!.uId,
        isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();

    }).catchError((Error) {
      print(Error.toString());
    });
  }
}
