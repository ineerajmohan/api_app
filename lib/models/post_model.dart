class PostModel {
  String? userId;
  String? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toString();
    id = json['id']?.toString();
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic> {};
    data ["userId"] = this.userId;
    data ["id"] = this.id;
    data ["title"] = this.title;
    data ["body"] = this.body;
    return data;
  }
}
