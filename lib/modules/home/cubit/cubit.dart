import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/project_model.dart';
import 'package:kadojopapp/modules/home/cubit/states.dart';

class NewProjectCubit extends Cubit<NewProjectStates> {
  NewProjectCubit() : super(NewProjectInitialState());

  static NewProjectCubit get(context) => BlocProvider.of(context);

  ProjectModel? projectModel;
  void getProject() async{
    //
    emit(GetNewProjectLoadingState());
   await FirebaseFirestore.instance
        .collection('project')
        .doc('gFYmoTD4xzfb9MrGmqt0')
        .get()
        .then((value) {
      print("value.data()==${value.data()}");
      projectModel =
          ProjectModel.fromJson(value.data() as Map<String, dynamic>);
      emit(GetNewProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetNewProjectErrorState(Error.toString()));
    });
  }

}
