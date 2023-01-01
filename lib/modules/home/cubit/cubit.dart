import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/Model/project_model.dart';
import 'package:kadojopapp/modules/home/cubit/states.dart';

class NewProjectCubit extends Cubit<NewProjectStates> {
  NewProjectCubit() : super(NewProjectInitialState());

  static NewProjectCubit get(context) => BlocProvider.of(context);

  ProjectModel? projectModel;
  List project= [];
  void getProject() async{
    //
    emit(GetNewProjectLoadingState());
  await FirebaseFirestore.instance.collection('project').get().then((value) {
      value.docs.forEach((element) {
        project.add(element.data());

        projectModel =
            ProjectModel.fromJson(element.data() as Map<String, dynamic>);
      });


/*;*/
      emit(GetNewProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetNewProjectErrorState(Error.toString()));
    });
  }

 static String formattedDate(timeStamp) {
   // var dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

    return DateFormat('dd-MM-yyyy').format(timeStamp) ;

  }




}
