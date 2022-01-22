class NotesModel {
  int? id;
  String? title;
  String? description;
  bool? state;

  NotesModel({
    this.id,
    this.title,
    this.description,
    this.state,
  });

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['state'] = state;

    return data;
  }
}
