import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/login/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool? login=true;
  void userLogin({
    required String email,
    required String password,
  })async {
    emit(LoginLoadingState());

  await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
    login=false;
      emit(LoginSuccessState(value.user!.uid));
      print('LoginSuccessState(value.user!.uid)==>${value.user!.uid}');

    }).catchError((onError) {
    login=true;
    ShowTost(msg: onError.code, state: TostState.ERROR);

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
