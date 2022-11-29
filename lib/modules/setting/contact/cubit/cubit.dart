import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/contact_model.dart';
import 'package:kadojopapp/Model/user_model.dart';
import 'package:kadojopapp/modules/setting/contact/cubit/states.dart';
import 'package:kadojopapp/shard/components/constants.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitialState());

  static ContactCubit get(context) => BlocProvider.of(context);
/*
  ContactModel? userModel;

  void getUserData() async {
    emit(GetUserUpdateLoadingState());

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      print('Value data${value.data()}');
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      print('Uid data${userModel!.uId}');
      emit(GetUserUpdateSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(GetUserUpdateErrorState(Error.toString()));
    });
  }
  */
  UserModel? userModel;
  ContactModel? contactModel;
  saveMassage({
    required String massage,
    required String subject,
  }) {
    ContactModel contactModel = ContactModel(
      // name: contactModell!.name,
      // email: contactModell!.email,
      //  phone: contactModell!.phone,
      massage: massage,
      subject: subject,
      email: userModel!.email,
      name: userModel!.name,
    );
    print('massage= $massage');
    print('subject= $subject');
    print('contactModel.massage = ${contactModel.massage}');

    emit(MassageSaveLoadingState());
    FirebaseFirestore.instance
        .collection('contact')
        .doc(uId)
        .set(contactModel.toMap())
        .then((value) {
      emit(MassageSaveSuccessesState());
    }).catchError((Error) {
      print(Error.toString());
      emit(MassageSaveErrorState(Error.toString()));
    });
  }
}
