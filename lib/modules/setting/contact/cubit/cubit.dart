import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/Model/contact_model.dart';
import 'package:kadojopapp/Model/user_model.dart';
import 'package:kadojopapp/modules/setting/contact/cubit/states.dart';

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

  saveMessage({
    required String message,
    required String subject,
    required String email,
    required String phone,
    required String name,
    required DateTime time,
  }) {
    ContactModel contactModel = ContactModel(
      // name: contactModel!.name,
      email: email,
      name: name,
      phone: phone,
      message: message,
      subject: subject,
      time: time,
    );
    print('massage= $message');
    print('subject= $subject');
    print('contactModel.massage = ${contactModel.message}');

    emit(MessageSaveLoadingState());
    FirebaseFirestore.instance
        .collection('contact')
        .doc()
        .set(contactModel.toMap())
        .then((value) {
      emit(MessageSaveSuccessesState());
    }).catchError((Error) {
      print(Error.toString());
      emit(MessageSaveErrorState(Error.toString()));
    });
  }
}
