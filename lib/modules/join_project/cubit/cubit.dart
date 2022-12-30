import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/project_model.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';
import 'package:kadojopapp/shard/components/constants.dart';

import '../../../Model/user_model.dart';

class JoinProjectCubit extends Cubit<JoinProjectStates> {
  JoinProjectCubit() : super(JoinProjectIniltionState());

  static JoinProjectCubit get(context) => BlocProvider.of(context);
  int CurrentStep = 0;
  void nextCurrentStep() {
    if (CurrentStep < 2) {
      emit(CurrentStepState());
      CurrentStep += 1;
    }
  }

  void backCurrentStep() {
    if (CurrentStep > 0) CurrentStep -= 1;
    emit(CurrentStepState());
  }
  void onTapen(int value){

    CurrentStep=value;
    emit(CurrentStepState());
  }
  ProjectModel? projectModel;
  void getProject() async{
    //
    emit(JoinProjectLoadingState());
    await FirebaseFirestore.instance
        .collection('project')
        .doc('gFYmoTD4xzfb9MrGmqt0')
        .get()
        .then((value) {
      print("value.data()==${value.data()}");
      projectModel =
          ProjectModel.fromJson(value.data() as Map<String, dynamic>);
      emit(JoinProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(JoinProjectErrorState(Error.toString()));
    });
  }

  bool? isActiv=false;
  void checkBox(value){
    isActiv=value;
    emit(TermsCheckBoxState());
  }

  bool? isActiv2=false;
  void checkBox2(value){
    isActiv2=value;
    emit(Terms2CheckBoxState());
  }

  UserModel? userModel;
  void getUserData() async {
    emit(GetUserInfoLoadingState());

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      emit(GetUserInfoSuccessState());
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      // print('Value data${value.data()}');

      // print('Uid data${userModel!.uId}');

    }).catchError((Error) {
      print(Error.toString());
      emit(GetUserInfoErrorState(Error.toString()));
    });
  }
}
