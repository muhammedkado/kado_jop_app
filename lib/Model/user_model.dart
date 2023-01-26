
class UserModel {
  String? name;
  String? email;
  String? phone;
  String? brithDay;
  String? country;
  String? gender;
  String? uId;
  String? time;
  //DateTime? timeStamp;
  bool? isEmailVerified;

  UserModel(

      {
        required this.isEmailVerified,
    required this.name,
    required this.email,
    required this.phone,
    required this.brithDay,
    required this.country,
    required this.gender,
    required this.uId,



  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    brithDay = json['brithday'];
    country = json['country'];
    gender = json['gender'];
    uId = json['uId'];

   //timeStamp = json['timeStamp'].toDate();
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
      'time': DateTime.now(),
      //'timeStamp': DateTime.now(),
      'isEmailVerified': isEmailVerified,
    };
  }
}
