class Todo {
  String? title;
  String? description;
  String? color;

  Todo({this.title, this.description, this.color});

  Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['color'] = this.color;
    return data;
  }
}