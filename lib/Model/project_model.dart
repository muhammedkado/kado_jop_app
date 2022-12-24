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
    };
  }
}
