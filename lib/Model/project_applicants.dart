import 'dart:core';

class Project_Applicants {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? birthDay;
  String? country;

  Project_Applicants(
    this.name,
    this.uId,
    this.email,
    this.phone,
    this.birthDay,
    this.gender,
    this.country,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'birthDay': birthDay,
      'country': country,
      'gender': gender,
      'uId': uId,
      'timeStamp': DateTime.now(),
    };
  }
}
