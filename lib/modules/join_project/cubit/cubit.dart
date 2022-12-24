import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';

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
}
