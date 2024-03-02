class Project {
  Project(
      {this.title,
      this.description,
      this.googlePlay,
      this.appStore,
      this.web,
      this.image,
      this.screenshots,
      this.skills});

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    googlePlay = json['google_play'];
    appStore = json['app_store'];
    web = json['web'];
    image = json['image'];
    screenshots = json['screenshots'].cast<String>();
    skills = json['skills'].cast<String>();
  }
  String? title;
  String? description;
  String? googlePlay;
  String? appStore;
  String? web;
  String? image;
  List<String>? screenshots;
  List<String>? skills;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['google_play'] = googlePlay;
    data['app_store'] = appStore;
    data['web'] = web;
    data['image'] = image;
    data['screenshots'] = screenshots;
    data['skills'] = skills;
    return data;
  }
}
