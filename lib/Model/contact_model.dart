class ContactModel {
  String? subject;
  String? mId;
  String? message;
  String? email;
  String? phone;
  String? name;
  DateTime? time;
  ContactModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.subject,
    required this.message,
     this.mId,
    required this.time,
  });
  ContactModel.fromJson(Map<String, dynamic> json) {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    subject = json['subject'];
    message = json['massage'];
    time = json['time'];
    mId = json['mId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'massage': message,
      'name': name,
      'email': email,
      'phone': phone,
      'time': time,
      'mId': mId,
    };
  }
}
