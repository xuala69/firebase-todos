class TodoModel {
  late String id;
  late String title;
  String? description;
  String? image;
  late bool done;
  TodoModel({
    required this.id,
    required this.title,
    this.description,
    this.image,
    required this.done,
  });

  TodoModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    done = json['done'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "done": done,
      "image": image,
    };
  }
}
