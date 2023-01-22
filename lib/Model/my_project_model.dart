class MyProjectModel {
  final String? ProjectName;
  final String? ProjectDetail;
  final String? ProjectID;

  MyProjectModel({
    required this.ProjectName,
    required this.ProjectDetail,
    required this.ProjectID,
  });

  Map<String, dynamic> toMap() {
    return {
      'ProjectID': ProjectID,
      'ProjectName': ProjectName,
      'ProjectDetail': ProjectDetail,
    };
  }
}

class Members {
  final String? UserID;
  final String? Username;
  final String? UserEmail;
  final String? UserPhone;

  Members({
    required this.UserID,
    required this.Username,
    required this.UserEmail,
    required this.UserPhone,
  });
  Map<String, dynamic> toMap() {
    return {

      'Username': Username,
      'UserEmail': UserEmail,
      'UserPhone': UserPhone,
      'UserID': UserID,

    };
  }

}
