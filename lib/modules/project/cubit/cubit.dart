import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/project/cubit/states.dart';

class MyProjectCubit extends Cubit<MyProjectStates> {
  MyProjectCubit() : super(MyProjectInitialState());

  static MyProjectCubit get(context) => BlocProvider.of(context);

  List MyProjectDetail = [];

  void getProject() async {
    emit(MyProjectLoadingState());
    await FirebaseFirestore.instance
        .collection('myPeoject')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        MyProjectDetail.add(element.data());

      });

      emit(MyProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(MyProjectErrorState(Error.toString()));
    });
  }
}
