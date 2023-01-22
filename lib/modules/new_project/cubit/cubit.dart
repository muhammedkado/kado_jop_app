import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/modules/new_project/cubit/states.dart';

class NewProjectCubit extends Cubit<NewProjectStates> {
  NewProjectCubit() : super(NewProjectInitialState());

  static NewProjectCubit get(context) => BlocProvider.of(context);

  List project = [];

  void getProject() async {
    emit(GetNewProjectLoadingState());
    await FirebaseFirestore.instance.collection('project').get().then((value) {
      value.docs.forEach((element) {
        project.add(element.data());
      });

/*;*/
      emit(GetNewProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetNewProjectErrorState(Error.toString()));
    });
  }

  static String formattedDate(timeStamp) {
    // DateTime dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    var timeStampp = timeStamp.toDate();
    return DateFormat('dd-MM-yyyy').format(timeStampp);
  }
}
