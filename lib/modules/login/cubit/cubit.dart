import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print('userLogin email=${value.user!.email}');
      print('userLogin uid= ${value.user!.uid}');
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  ChangePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
