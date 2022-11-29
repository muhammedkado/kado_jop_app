class ContactModel{

  String? subject;
  String? massage;
  String? email;
  String? name;
  ContactModel({
required this.email,
    required this.name,
    required this.subject,
    required this.massage,
  });
  ContactModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    email=json['email'];
  subject=json['subject'];
  massage=json['massage'];
  }

  Map<String, dynamic> toMap() {
    return {

      'subject': subject,
      'massage': massage,
      'name': name,
      'email': email,
    };
  }



}