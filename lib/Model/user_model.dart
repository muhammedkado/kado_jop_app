class UserModel {
  String? name;
  String? email;
  String? phone;
  String? brithDay;
  String? country;
  String? gender;
  String? uId;
  bool? isEmailVerified;

  UserModel(
    this.name,
    this.email,
    this.phone,
    this.brithDay,
    this.country,
    this.gender,
    this.uId,
    this.isEmailVerified,
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    brithDay = json['brithday'];
    country = json['country'];
    gender = json['gender'];
    uId = json['uId'];
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
      'isEmailVerified': isEmailVerified,
    };
  }

}
