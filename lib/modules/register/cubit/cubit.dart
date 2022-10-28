import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/user_model.dart';
import 'package:kadojopapp/modules/register/cubit/state.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
     String? uId,
  }) async {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      userCreate(email: email,name: name,phone: phone,uId: value.user!.uid,);
      emit(RegisterSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterErorrState(onError));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
     bool isEmailVerified=false,
  }) {
    UserModel model = UserModel(
      name,
      email,
      phone,
      uId,
      isEmailVerified,

    );
    emit(CreateLoadingState());
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(CreateErorrState(Error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
}
