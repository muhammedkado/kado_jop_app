class Project_Applicants {
  String? pId;
  String? projectName;
  String? projectEndData;
  String? projectProfit;
  String? projectDetails;
  bool? isApply=false;


  //DateTime? timeStamp;

  Project_Applicants( //this.timeStamp,
      {
    required this.pId,
    required this.projectName,
    required this.projectEndData,
    required this.projectProfit,
    required this.projectDetails,
    required this.isApply,

  });
  Project_Applicants.FromJson(Map<String,dynamic> json) {
    pId = json['pId'];
    isApply = json['isApply'];
    projectName = json['projectName'];
    projectEndData = json['projectEndData'];
    projectProfit = json['projectProfit'];
    projectDetails = json['projectDetails'];

  }
  Map<String, dynamic> toMap() {
    return {
      'pId': pId,
      'projectName': projectName,
      'projectEndData': projectEndData,
      'projectProfit': projectProfit,
      'projectDetails': projectDetails,
      'isApply':isApply,

      'timeStamp': DateTime.now(),
    };
  }
}
