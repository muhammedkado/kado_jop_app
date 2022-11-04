class PorjectModel {
  String? description;
  String? icon;
  String? title;
  String? type;


  PorjectModel(
      this.description,
      this.icon,
      this.title,
      this.type,

      );

  PorjectModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
    title = json['title'];
    type = json['type'];

  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'icon': icon,
      'title': title,
      'type': type,

    };
  }
}
