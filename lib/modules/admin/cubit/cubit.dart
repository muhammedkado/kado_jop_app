import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';

class AdminCubit extends Cubit<AdminState>{
  AdminCubit( ) : super(AdminInitialState());

static  AdminCubit get(context)=>BlocProvider.of(context);

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

}