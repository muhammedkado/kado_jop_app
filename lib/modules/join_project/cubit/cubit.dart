import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/my_project_model.dart';
import 'package:kadojopapp/Model/project_applicants_model.dart';
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

  List projectDetail = [];

  void getProject() async {
    //
    emit(JoinProjectLoadingState());
    await FirebaseFirestore.instance.collection('project').get().then((value) {
      value.docs.forEach((element) {
        projectDetail.add(element.data());
      });

      emit(JoinProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(JoinProjectErrorState(Error.toString()));
    });
  }

  UserModel? userModel;

  void getUserData() async {
    emit(GetUserInfoLoadingState());

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(GetUserInfoSuccessState());
      print(userModel!.name);
    }).catchError((Error) {
      print(Error.toString());
      emit(GetUserInfoErrorState(Error.toString()));
    });
  }

  bool? isActiv = false;

  void checkBox(value) {
    isActiv = value;
    emit(TermsCheckBoxState());
  }

  bool isActiv2 = false;

  void checkBox2(value) {
    isActiv2 = value;
    emit(Terms2CheckBoxState());
  }


  List getDetailApplyProject = [];

  void getUserApplyProject( ) async {
    //
    emit(getUserApplyProjectLadingState());
    await FirebaseFirestore.instance.collection('user').doc(uId).collection('myProject').get().then((value) {
      value.docs.forEach((element) {
        getDetailApplyProject.add(element.data());
      });
      emit(getUserApplyProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(getUserApplyProjectErrorState(Error.toString()));
    });
  }
  bool startValue=false;
  void setUserApplyProject({
    required String pId,
    required String docId,
    required String projectName,
    required String projectEndData,
    required String projectProfit,
    required String projectDetails,
  }) {
    emit(SetMyProjectLadingState());

    Project_Applicants myProject = Project_Applicants(
      projectName: projectName,
      pId: pId,
      projectDetails: projectDetails,
      projectEndData: projectEndData,
      projectProfit: projectProfit,
      isApply: true,
    );

    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('myProject')
        .doc(docId)
        .set(myProject.toMap())
        .then((value) {
      emit(SetMyProjectSuccessState());

    }).catchError((Error) {
      print(Error.toString());
      emit(SetMyProjectErrorState(Error.toString()));
    });
  }

  void ApplyProject({
    required String pId,
    required String ProjectName,
    required String ProjectDetail,
    //----
    required String UserId,
    required String Username,
    required String UserEmail,
    required String UserPhone,
  }) {
    emit(MyProjectLadingState());
    MyProjectModel myProject = MyProjectModel(
      ProjectName: ProjectName,
      ProjectDetail: ProjectDetail,
      ProjectID: pId,
    );
    Members setMember = Members(
      Username: Username,
      UserEmail: UserEmail,
      UserPhone: UserPhone,
      UserID: UserId,
    );
    var projectInfo =
        FirebaseFirestore.instance.collection('MyProject').doc(pId);
    projectInfo.set(myProject.toMap()).then((value) {
      emit(MyProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(MyProjectErrorState(Error.toString()));
    });

    projectInfo
        .collection('members')
        .doc(UserId)
        .set(setMember.toMap())
        .then((value) {
      emit(SetMemberToProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(SetMemberToProjectErrorState(Error.toString()));
    });
  }
}
