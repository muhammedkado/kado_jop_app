import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/user_model.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/components/constants.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  bool notification = true;
  void changeNotification(index) {
    notification = index;
    emit(NotificationButtonSuccessState());
  }



  List<String> language = ['English'];
  var languages;
  languageDropdown(value) {
    languages = value.toString();
    emit(LanguageSelectSuccessState());
  }

  void signOut({
    required context,
    required Widget screen,
  }) {
    emit(SignOutLoadingState());
    CachHelper.removeData(key: 'uId').then((value) {
      NavigatorAndFinish(context: context, Widget: screen);
      emit(SignOutSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SignOutErrorState());
    });
  }

  UserModel? userModel;
List userModelList=[];
  Future getUserData() async {
    emit(SettingUserUpdateLoadingState());

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      emit(SettingUserUpdateSuccessState());

      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);

      // print('Value data${value.data()}');

      // print('Uid data${userModel!.uId}');
    }).catchError((Error) {
      print(Error.toString());
      print('============>${Error.toString()}');
      ShowTost(msg: Error.toString(), state: TostState.ERROR);
      emit(SettingUserUpdateErrorState(Error.toString()));
    });
  }

  Future userUpdate({
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

  await  FirebaseFirestore.instance
        .collection('user')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();

    }).catchError((Error) {
      emit(UserUpdateErrorState(Error));
      print('============>${Error.toString()}');
    });
  }
}
