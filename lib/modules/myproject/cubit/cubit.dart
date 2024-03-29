import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/myproject/cubit/states.dart';
import 'package:kadojopapp/shard/components/constants.dart';

class MyProjectCubit extends Cubit<MyProjectStates> {
  MyProjectCubit() : super(MyProjectInitialState());

  static MyProjectCubit get(context) => BlocProvider.of(context);

  List MyProjectDetail = [];

  void getProject() async {
    emit(MyProjectLoadingState());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('myProject')
        .get()
        .then((value) {
      value.docs.forEach((element) {
       // print(element.data());
        MyProjectDetail.add(element.data());
      });
      emit(MyProjectSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(MyProjectErrorState(Error.toString()));
    });
  }
}
