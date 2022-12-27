import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? brithDay;
  String? country;
  String? gender;
  String? uId;
  Timestamp? timeStamp;
  bool? isEmailVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.brithDay,
    required this.country,
    required this.gender,
    required this.uId,
    // this.timeStamp,
    required this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    brithDay = json['brithday'];
    country = json['country'];
    gender = json['gender'];
    uId = json['uId'];
   // timeStamp = json['timeStamp'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'brithday': brithDay,
      'country': country,
      'gender': gender,
      'uId': uId,
      //'timeStamp': DateTime.now(),
      'isEmailVerified': isEmailVerified,
    };
  }
}
