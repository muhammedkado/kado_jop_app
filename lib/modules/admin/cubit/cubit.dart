import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/Model/project_model.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  var jobRol;

  jobRolDropdown(value) {
    jobRol = value.toString();
    emit(JobRolDropDownSuccessState());
  }

  var jobType;

  jobTypeDropdown(value) {
    jobType = value.toString();
    emit(jobTypeDropDownSuccessState());
  }

  void setProject({
    required String? duration,
    required String? jobrole,
    required String? jobtybe,
    required String? detail,
    required String? endtime,
    required String? name,
    required String? starttime,
    required String? vaildhurs,
    required String? terms1,
    required String? terms2,
    String? PUid,
  }) {
    ProjectModel projectModel = ProjectModel(
      duration: duration,
      jobrole: jobrole,
      jobtybe: jobtybe,
      detail: detail,
      endtime: endtime,
      name: name,
      starttime: starttime,
      vaildhurs: vaildhurs,
      terms1: terms1,
      terms2: terms2,
    );
    final setProject = FirebaseFirestore.instance.collection('project').doc();
    projectModel.pid = setProject.id;

    setProject.set(projectModel.toMap()).then((value) {
      ShowTost(msg: 'Project has ben add', state: TostState.SUCCESS);

      emit(SetProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      ShowTost(msg: Error.toString(), state: TostState.ERROR);
      emit(SetProjectErrorState());
    });
  }

  void updateProject({
    required String? duration,
    required String? jobrole,
    required String? jobtybe,
    required String? detail,
    required String? endtime,
    required String? name,
    required String? starttime,
    required String? vaildhurs,
    required String? terms1,
    required String? terms2,
    required String? Pid,
  }) async {
    emit(UpdateProjectLoadingState());
    ProjectModel projectModel = ProjectModel(
      pid: Pid,
      duration: duration,
      jobrole: jobrole,
      jobtybe: jobtybe,
      detail: detail,
      endtime: endtime,
      name: name,
      starttime: starttime,
      vaildhurs: vaildhurs,
      terms1: terms1,
      terms2: terms2,
    );
    await FirebaseFirestore.instance
        .collection('project')
        .doc(Pid)
        .update(projectModel.toMap())
        .then((value) {
      ShowTost(msg: 'Project Update Successfully', state: TostState.SUCCESS);
      emit(UpdateProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      ShowTost(msg: Error.toString(), state: TostState.ERROR);
      emit(UpdateProjectErrorState());
    });
  }

  void deleteProject({required PUid}) async {
    emit(DeleteProjectLoadingState());
    await FirebaseFirestore.instance
        .collection('project')
        .doc(PUid)
        .delete()
        .then((value) {
      emit(DeleteProjectSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(DeleteProjectErrorState(onError.toString()));
    });
  }
  void deleteMessage({required mId}) async {
    emit(DeleteProjectLoadingState());
    await FirebaseFirestore.instance
        .collection('contact')
        .doc(mId)
        .delete()
        .then((value) {
      emit(DeleteProjectSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(DeleteProjectErrorState(onError.toString()));
    });
  }
  List project = [];

  void getProject() async {
    emit(GetProjectLoadingState());
    await FirebaseFirestore.instance.collection('project').get().then((value) {
      value.docs.forEach((element) {
        project.add(element.data());
      });

/*;*/
      emit(GetProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetProjectErrorState(Error.toString()));
    });
  }

  List messages = [];

  void getMessages() async {

    emit(GetMessagesLoadingState());
   var reff =  await FirebaseFirestore.instance.collection("contact");
   reff.get().then((value) {
      value.docs.forEach((element) {
        messages.add(element.data());
      });


      emit(GetMessagesSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetMessagesErrorState(Error.toString()));
    });
  }

  static String formattedDate(timeStamp) {
    // DateTime dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    var timeStampp = timeStamp.toDate();
    return DateFormat('dd-MM-yyyy H:m').format(timeStampp);
  }
}
