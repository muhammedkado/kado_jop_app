
class ProjectModel {
  String? duration;
  String? jobrole;
  String? jobtybe;
  String? detail;
  String? endtime;
  String? name;
  String? publishtime;
  String? rules;
  String? starttime;
  String? vaildhurs;
  String? terms1;
  String? terms2;
  DateTime? timeStamp;
  int? id;
  ProjectModel(
    this.duration,
    this.jobrole,
    this.jobtybe,
    this.detail,
    this.endtime,
    this.name,
    this.publishtime,
    this.rules,
    this.starttime,
    this.vaildhurs,
    this.terms1,
    this.terms2,
    this.timeStamp,
    this.id,
  );

  ProjectModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detail = json['detail'];
    duration = json['duration'];
    jobrole = json['jobrole'];
    jobtybe = json['jobtybe'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    publishtime = json['publishtime'];
    rules = json['rules'];
    vaildhurs = json['vaildhurs'];
    terms1 = json['terms1'];
    terms2 = json['terms2'];
    id = json['id'];
    timeStamp = json['timeStamp'].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'duration': duration,
      'jobrole': jobrole,
      'jobtybe': jobtybe,
      'starttime': starttime,
      'endtime': endtime,
      'publishtime': publishtime,
      'rules': rules,
      'vaildhurs': vaildhurs,
      'terms2': terms2,
      'terms1': terms1,
     //'timeStamp': DateTime.now(),
    };
  }
}
