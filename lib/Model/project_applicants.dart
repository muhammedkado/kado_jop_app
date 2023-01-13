import 'dart:core';

class Project_Applicants {
  String? pId;
  String? projectName;
  String? projectEndData;
  String? projectProfit;
  String? projectDetails;

  //DateTime? timeStamp;

  Project_Applicants( //this.timeStamp,
      {
    required this.pId,
    required this.projectName,
    required this.projectEndData,
    required this.projectProfit,
    required this.projectDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'pId': pId,
      'projectName': projectName,
      'projectEndData': projectEndData,
      'projectProfit': projectProfit,
      'projectDetails': projectDetails,
      'timeStamp': DateTime.now(),
    };
  }
}
