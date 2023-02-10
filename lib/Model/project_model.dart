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
  String? pid;

  ProjectModel({
    required this.duration,
    required this.jobrole,
    required this.jobtybe,
    required this.detail,
    required this.endtime,
    required this.name,
    this.publishtime,
    this.rules,
    required this.starttime,
    required this.vaildhurs,
    required this.terms1,
    required this.terms2,
     this.timeStamp,
     this.pid,
  });

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
    pid = json['pid'];
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
      //'publishtime': publishtime,
    //  'rules': rules,
      'vaildhurs': vaildhurs,
      'terms2': terms2,
      'terms1': terms1,
      'pid': pid,
      'timeStamp': DateTime.now(),
    };
  }
}
